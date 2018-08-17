class Batch
  attr_reader :has_error    # エラーが発生した場合にtrue

  def initialize(log_file_base:)
    @log_dir = "#{Rails.root}/log"
    @logger = Logger.new("#{@log_dir}/#{log_file_base}_#{Date.today.strftime('%Y%m%d')}.log")

    # SQLログをログに吐く
    if Rails.env.development?
      ActiveRecord::Base.logger = Logger.new("#{@log_dir}/sql_#{Date.today.strftime('%Y%m%d')}.log")
      ActiveRecord::Base.logger.level = 0
    end

    @has_error = false
  end

  def execute
    @logger.info("#{self.class} start")

    begin
      process
    rescue => ex
      @logger.error("#{ex.message}")
      @has_error = true
    end

    @logger.info("#{self.class} end")

  end

  def process
    raise NotImplementedError.new("#{self.class.name}.#{__method__} is an abstract method.")
  end
end