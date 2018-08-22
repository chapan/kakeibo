class TweetManager < Manager

  def initialize
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter.consumer_key
      config.consumer_secret = Settings.twitter.consumer_secret
      config.access_token = Settings.twitter.access_token
      config.access_token_secret = Settings.twitter.access_token_secret
    end
  end

  # ツイートする
  # message ツイート内容
  def tweet(message)
    @twitter.update(message)
  end

  # プロフィールの変更
  # 指定されたもののみ更新する
  # name        名前
  # description 説明
  # url         ホームページ
  # location    場所
  # profile_link_color テーマカラー(#FFFFFFで指定)
  def update_profile(name: nil, description: nil, url: nil, location: nil, profile_link_color: nil)
    options = {}
    self.method(__callee__).parameters.map do |arg_type, arg|
      options[arg] = eval(arg.to_s) if eval(arg.to_s).present?
    end

    @twitter.update_profile(options) if options.length > 0
  end

end