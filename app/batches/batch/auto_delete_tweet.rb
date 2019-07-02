class Batch::AutoDeleteTweet < Batch
  def initialize
    @log_file_base = 'auto_delete_tweet'
    super(log_file_base: @log_file_base)
  end

  def process

    manager = TweetManager.new

    # 削除基準日
    delete_date = Settings.twitter.expire_days.days.ago

    delete_tweets = ::Tweet.where(deleted_at: nil).where("tweeted_at < ?", delete_date).order(:tweeted_at).limit(100)

    delete_tweets.each do |tweet|
      @logger.debug("削除予定:#{tweet.tweet_id}")
      deleted_tweet = manager.delete_tweet(tweet.tweet_id)
      next if deleted_tweet.nil?
      @logger.info("削除:#{deleted_tweet}")
      tweet.deleted_at = DateTime.now
      tweet.save!
    end
  end

end