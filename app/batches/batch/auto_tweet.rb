class Batch::AutoTweet < Batch
  def initialize
    @log_file_base = 'auto_tweet'
    super(log_file_base: @log_file_base)
  end

  def process
    # マネージャー
    twitter = TweetManager.new
    calc = CalcManager.new

    # 計算基準日(毎月一日になるはず)
    date = Date.today

    # 先月の課金額を計算
    month_total = calc.calc_socail_game_total_of_month(date.last_month.year, date.last_month.month)
    message = "#{Settings.twitter.month_result_base}#{month_total.to_s(:delimited)}円"

    # 年が変わった場合は年額も一緒にツイート
    if date.year != date.last_month.year
      year_total = calc.calc_socail_game_total_of_yeat(date.last_month.year)
      message = "#{message}¥n#{Settings.twitter.year_result_base}#{year_total.to_s(:delimited)}円"
    end

    twitter.tweet(message)

    charge_lv, charge_exp = calc.calc_twitter_status_param
    name = Settings.twitter.name_base + charge_lv.to_s
    description = Settings.twitter.description_base + (charge_exp).to_s

    # プロフィール更新
    twitter.update_profile(name: name, description: description)

  end

end