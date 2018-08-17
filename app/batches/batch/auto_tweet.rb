class Batch::AutoTweet < Batch
  def initialize
    @log_file_base = 'auto_tweet'
    super(log_file_base: @log_file_base)
  end

  def process
    #TweetManager.new.tweet("てすと")
  end

end