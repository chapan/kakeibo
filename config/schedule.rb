# Learn more: http://github.com/javan/whenever

# ログの出力先を設定
set :output, 'log/crontab.log'

# production 環境で cron 実行
set :environment, :production

# 毎月1日の 00:00 に
every '0 0 1 * *' do
  # 自動ツイートバッチを実行
  runner "Batch::AutoTweet.new.execute"
end