class Batch::LoadTweetJson < Batch
  def initialize
    @log_file_base = 'load_tweet_json'
    super(log_file_base: @log_file_base)
  end

  def process

    require "json"

    array = File.open(Settings.twitter.json_file_name) do |j|
       JSON.load(j)
    end

    array.each do |hash|
      next if ::Tweet.find_by(tweet_id: hash["id"])
      ::Tweet.new(tweet_id: hash["id"], body: hash["full_text"], tweeted_at: hash["created_at"]).save
    end

  end

end