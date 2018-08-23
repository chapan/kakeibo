class Twitter::TweetsController < BaseController

  REQUIRE_EXP = 10000

  def tweet

  end

  # 課金額を集計してプロフィールを更新する(手動更新用)
  def update_profile
    charge_lv, charge_exp = calc_status
    name = Settings.twitter.name_base + charge_lv.to_s
    description = Settings.twitter.description_base + (REQUIRE_EXP - charge_exp).to_s

    begin
      twitter = TweetManager.new

      # プロフィール更新
      twitter.update_profile(name: name, description: description)
      # ツイート
      twitter.tweet("現在のレベル #{charge_lv}\n次のレベルまで #{REQUIRE_EXP - charge_exp}")

      redirect_to :kakeis, flash: {notice: "ツイッターを更新しました。"}
    rescue => ex
      redirect_to :kakeis, flash: {alert: "エラーが発生しました。\n#{ex.message}"}
    end
  end

  private
  def calc_status
    @from = Date.today.beginning_of_year
    @to   = @from.end_of_year
    sum_kingaku = Kakei.where(use_date: @from...@to, category_id: Category.category_id.social_game.value).sum(:kingaku)
    sum_kingaku.divmod(REQUIRE_EXP)
  end
end
