class Twitter::TweetsController < BaseController

  def tweet

  end

  # プロフィールを更新する(手動更新用)
  def update_profile

    begin
      # プロフィール更新
      TweetManager.new.update_twitter_profile

      redirect_to :kakeis, flash: {notice: "ツイッターを更新しました。"}
    rescue => ex
      redirect_to :kakeis, flash: {alert: "エラーが発生しました。\n#{ex.message}"}
    end
  end

end
