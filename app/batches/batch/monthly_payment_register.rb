class Batch::MonthlyPaymentRegister < Batch
  def initialize
    @log_file_base = 'monthly_payment_register'
    super(log_file_base: @log_file_base)
  end

  def process
    # 月額課金全件取得
    monthly_payments = MonthlyPayment.all.order(:category_id, :id)

    # 登録日(毎月1日)
    use_date = Date.today.beginning_of_month

    # 登録されている月額課金を登録する
    monthly_payments.each do |payment|
      kakei = Kakei.new
      kakei.use_date = use_date
      kakei.category_id = payment.category_id
      kakei.naiyou = payment.naiyou
      kakei.kingaku = payment.kingaku
      kakei.credit_flag = payment.credit_flag
      kakei.save!
    end

  end

end