class Twitter::TweetsController < BaseController

  def tweet

  end

  # 課金額を集計してプロフィールを更新する(手動更新用)
  def update_profile
    charge_lv, charge_exp = CalcManager.new.calc_twitter_status_param
    name = Settings.twitter.name_base + charge_lv.to_s
    description = Settings.twitter.description_base + (charge_exp).to_s

    begin
      twitter = TweetManager.new

      # プロフィール更新
      twitter.update_profile(name: name, description: description)
      # ツイート
      # twitter.tweet("現在のレベル #{charge_lv}\n次のレベルまで #{charge_exp}")

      redirect_to :kakeis, flash: {notice: "ツイッターを更新しました。"}
    rescue => ex
      redirect_to :kakeis, flash: {alert: "エラーが発生しました。\n#{ex.message}"}
    end
  end

end
