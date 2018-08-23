class CalcManager < Manager
  REQUIRE_EXP = 10000

  def initialize

  end

  # 指定した年の課金総額を計算する
  # param year 年
  # return total 総額
  def calc_socail_game_total_of_year(year)
    from = Date.new(year, 1, 1)
    to   = from.end_of_year
    Kakei.where(use_date: from...to, category_id: Category.category_id.social_game.value).sum(:kingaku)
  end

  # ツイッター用のレベルとレベルアップに必要な経験値を計算し返す
  # return [level, exp]
  # level レベル
  # exp 次のレベルまで必要な経験値
  def calc_twitter_status_param
    sum_kingaku = calc_socail_game_total_of_year(Date.today.year)
    level, exp = sum_kingaku.divmod(REQUIRE_EXP)
    [level, REQUIRE_EXP - exp]
  end
end