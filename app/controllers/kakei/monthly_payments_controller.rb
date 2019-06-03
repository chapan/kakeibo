class Kakei::MonthlyPaymentsController < Kakei::BaseKakeiController
  def index
    display
  end
  def create
    @new_monthly_payment = MonthlyPayment.new(monthly_payment_params)

    begin
      @new_monthly_payment.save!

      redirect_to({action: :index}, flash: {notice: "登録しました。"})
    rescue => ex
      display
      flash.now[:alert] = ex.message
      render :index
    end
  end
  def edit
    @monthly_payment = MonthlyPayment.find_by(id: params[:id])
    if @monthly_payment.nil?
      redirect_to({action: :index}, flash: {notice: "データが存在しません。"})
    end
  end
  def update
    @monthly_payment = MonthlyPayment.new(monthly_payment_params)

    begin
      monthly_payment = MonthlyPayment.find(params[:id])
      monthly_payment.category_id = @monthly_payment.category_id
      monthly_payment.naiyou = @monthly_payment.naiyou
      monthly_payment.kingaku = @monthly_payment.kingaku
      monthly_payment.credit_flag = @monthly_payment.credit_flag
      monthly_payment.save!

      redirect_to({action: :index}, flash: {notice: "更新しました。"})
    rescue => ex
      flash.now[:alert] = ex.message
      render :edit
    end
  end
  def destroy
    begin
      monthly_payment = MonthlyPayment.find(params[:id])
      monthly_payment.destroy!

      # redirect_back fallback_location: {action: :index}, :notice => "削除しました。"
      redirect_to({action: :index}, flash: {notice: "削除しました。"})
    rescue => ex
      display
      flash.now[:alert] = ex.message
      render :index
    end
  end

  private
  def monthly_payment_params
    params.require(:monthly_payment).permit(:category_id, :naiyou, :kingaku, :credit_flag)
  end
  def display
    @categories = Category.all
    @monthly_payments = MonthlyPayment.all.order(:category_id, :id)
    @new_monthly_payment = MonthlyPayment.new
  end
end
