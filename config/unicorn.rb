RAILS_ROOT = File.expand_path("../..", __FILE__)

working_directory "#{RAILS_ROOT}"
pid               "#{RAILS_ROOT}/tmp/pids/unicorn.pid"
stderr_path       "#{RAILS_ROOT}/log/unicorn.log"
stdout_path       "#{RAILS_ROOT}/log/unicorn.log"

#listen "/tmp/unicorn.sock"
listen 3000
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 4)
timeout 30

before_fork do |server, worker|
    old_pid = "#{ server.config[:pid] }.oldbin"
    if File.exists?(old_pid) && server.pid != old_pid
        begin
          # 古いマスターがいたら死んでもらう
          Process.kill("QUIT", File.read(old_pid).to_i)
          rescue Errno::ENOENT, Errno::ESRCH
    end
end

defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
    Signal.trap 'TERM' do
        puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
    end

    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end
