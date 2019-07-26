class Batch::AutoTweet < Batch
  def initialize
    @log_file_base = 'auto_tweet'
    super(log_file_base: @log_file_base)
  end

  def process
    # マネージャー
    twitter = TweetManager.new

    # プロフィール更新
    twitter.update_twitter_profile

    # 計算基準日
    date = Date.today

    # １日でなければ終了
    return unless date.day == 1

    # マネージャー
    calc = CalcManager.new

    # 先月の課金額を計算
    month_total = calc.calc_socail_game_total_of_month(date.last_month.year, date.last_month.month)
    message = "#{Settings.twitter.month_result_base}#{month_total.to_s(:delimited)}円"

    # 年が変わった場合は年額も一緒にツイート
    if date.year != date.last_month.year
      year_total = calc.calc_socail_game_total_of_year(date.last_month.year)
      message = "#{message}\n#{Settings.twitter.year_result_base}#{year_total.to_s(:delimited)}円"
    end

    twitter.tweet(message)

  end

end