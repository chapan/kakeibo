# Learn more: http://github.com/javan/whenever

# ログの出力先を設定
set :output, 'log/crontab.log'

# production 環境で cron 実行
set :environment, :production

# 毎時実行
every '5 * * * *' do
  # ツイート収集バッチを実行
  runner "Batch::AutoCollectTweets.new.execute"
end

# 毎日 00:00 に
every '0 0 * * *' do
  # 自動ツイートバッチを実行
  runner "Batch::AutoTweet.new.execute"
end

# 毎日 04:10 に
every '10 4 * * *' do
  # ツイート削除バッチを実行
  runner "Batch::AutoDeleteTweet.new.execute"
end

# 毎月1日の 00:00 に
every '0 0 1 * *' do
  # 月額支払い登録
  runner "Batch::MonthlyPaymentRegister.new.execute"
end

