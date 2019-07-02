class Batch::AutoCollectTweets < Batch
  def initialize
    @log_file_base = 'auto_collect_tweets'
    super(log_file_base: @log_file_base)
  end

  def process
    # マネージャー
    twitter = TweetManager.new

    # DBから現在取得しているツイートの最新を取得
    latest_tweet = ::Tweet.order(tweet_id: :desc).first
    since_id = latest_tweet.present? ? latest_tweet.tweet_id : nil

    # oldest_tweet = ::Tweet.order(tweet_id: :asc).first
    # max_id = oldest_tweet.present? ? oldest_tweet.tweet_id : nil
    max_id = nil

    # ツイート取得
    loop do
      tweets = twitter.get_tweet_list(Settings.twitter.user_id, since_id: since_id, max_id: max_id)

      tweets.each do |tweet|
        next if ::Tweet.find_by(tweet_id: tweet.id)
        ::Tweet.new(tweet_id: tweet.id, body: tweet.text, tweeted_at: tweet.created_at).save
        max_id = tweet.id
      end

      # 0になったら終了
      break if tweets.count <= 1

      @logger.info("取得件数:#{tweets.count}")
      sleep 1
    end

  end

end