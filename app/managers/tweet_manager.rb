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
    if Rails.env.production?
      res = @twitter.update(message)
      Rails.logger.info("ツイッター投稿:#{res}")
    else
      Rails.logger.debug("(Debug)ツイッター投稿:#{message}")
    end
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

    if Rails.env.production?
      if options.length > 0
        res = @twitter.update_profile(options)
        Rails.logger.info("ツイッタープロフィール更新:#{res}")
      end
    else
      Rails.logger.debug("(Debug)ツイッタープロフィール更新:#{options}")
    end
  end

end