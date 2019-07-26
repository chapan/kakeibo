class CalcManager < Manager
  REQUIRE_EXP = 10000

  def initialize

  end

  # 指定した年月の課金総額を計算する
  # param year 年
  # param month 月
  # return total 総額
  def calc_socail_game_total_of_month(year, month)
    from = Date.new(year, month, 1)
    to   = from.end_of_month
    Kakei.where(use_date: from...to, category_id: Category.category_id.social_game.value).sum(:kingaku)
  end

  # 指定した年の課金総額を計算する
  # param year 年
  # return total 総額
  def calc_socail_game_total_of_year(year)
    from = Date.new(year, 1, 1)
    to   = from.end_of_year
    Kakei.where(use_date: from...to, category_id: Category.category_id.social_game.value).sum(:kingaku)
  end

  # ツイッター更新用のパラメータを計算し返す
  # return [days, sum_kingaku]
  # days 課金に負けなかった日数
  # sum_kingaku 年内合計額
  def calc_twitter_status_param
    day = Kakei.where(category_id: Category.category_id.social_game.value).maximum(:use_date)
    today = Date.today
    days = today - day
    sum_kingaku = calc_socail_game_total_of_year(Date.today.year)
    [days.to_i, sum_kingaku]
  end
end