class Kakei::KakeisController < Kakei::BaseKakeiController

  def index
    display
  end

  def create
    @new_kakei = Kakei.new(kakei_params)

    begin
      @new_kakei.save!
      #redirect_to :kakeis, flash: {notice: "登録しました。"}
      redirect_to({action: :monthly, year: @new_kakei.use_date.year, month: @new_kakei.use_date.month, day: @new_kakei.use_date.day}, flash: {notice: "登録しました。"})
    rescue => ex
      display(@new_kakei.use_date)
      flash.now[:alert] = ex.message
      render :index
    end
  end
  def edit

  end
  def update

  end
  def destroy
    Kakei.destroy(params[:id])
    #redirect_to_ :back, :notice => "削除しました。"
    redirect_back fallback_location: {action: :index}, :notice => "削除しました。"
  end
  def redirect
    redirect_to :kakeis
  end
  def summary

    sql = <<-SQL
SELECT
  DATE_FORMAT(use_date, '%Y-%m') as sumYM,
  SUM(CASE WHEN category_id = 1 THEN kingaku ELSE 0 END) AS sum01,
  SUM(CASE WHEN category_id = 2 THEN kingaku ELSE 0 END) AS sum02,
  SUM(CASE WHEN category_id = 3 THEN kingaku ELSE 0 END) AS sum03,
  SUM(CASE WHEN category_id = 4 THEN kingaku ELSE 0 END) AS sum04,
  SUM(CASE WHEN category_id = 9 THEN kingaku ELSE 0 END) AS sum09,
  SUM(CASE WHEN category_id = 5 THEN kingaku ELSE 0 END) AS sum05,
  SUM(CASE WHEN category_id = 6 THEN kingaku ELSE 0 END) AS sum06,
  SUM(CASE WHEN category_id = 8 THEN kingaku ELSE 0 END) AS sum08,

  SUM(CASE WHEN credit_flag = 0 and category_id <> 7 and category_id <> 10 THEN kingaku ELSE 0 END) AS genkin,
  SUM(CASE WHEN credit_flag = 1 THEN kingaku ELSE 0 END) AS credit,
  SUM(CASE WHEN category_id <> 7 and category_id <> 10 THEN kingaku ELSE 0 END) AS total,

  SUM(CASE WHEN category_id = 7 or category_id = 10 THEN kingaku ELSE 0 END) AS sum07
FROM
  kakeis
GROUP BY DATE_FORMAT(use_date, '%Y-%m')
ORDER BY DATE_FORMAT(use_date, '%Y-%m') desc
    SQL


    @summary = Kakei.find_by_sql(sql)

  end
  def monthly
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].present? ? params[:day].to_i : 1
    begin
      from = Date.new(year, month, day)
    rescue
      from = Date.today
    end
    display(from)
    render :index

  end
  def yearly

    sql = <<-SQL
SELECT
  concat(DATE_FORMAT(use_date, '%Y'), '-01') as sumYM,
  SUM(CASE WHEN category_id = 1 THEN kingaku ELSE 0 END) AS sum01,
  SUM(CASE WHEN category_id = 2 THEN kingaku ELSE 0 END) AS sum02,
  SUM(CASE WHEN category_id = 3 THEN kingaku ELSE 0 END) AS sum03,
  SUM(CASE WHEN category_id = 4 THEN kingaku ELSE 0 END) AS sum04,
  SUM(CASE WHEN category_id = 9 THEN kingaku ELSE 0 END) AS sum09,
  SUM(CASE WHEN category_id = 5 THEN kingaku ELSE 0 END) AS sum05,
  SUM(CASE WHEN category_id = 6 THEN kingaku ELSE 0 END) AS sum06,
  SUM(CASE WHEN category_id = 8 THEN kingaku ELSE 0 END) AS sum08,

  SUM(CASE WHEN credit_flag = 0 and category_id <> 7 and category_id <> 10 THEN kingaku ELSE 0 END) AS genkin,
  SUM(CASE WHEN credit_flag = 1 THEN kingaku ELSE 0 END) AS credit,
  SUM(CASE WHEN category_id <> 7 and category_id <> 10 THEN kingaku ELSE 0 END) AS total,

  SUM(CASE WHEN category_id = 7 or category_id = 10 THEN kingaku ELSE 0 END) AS sum07

FROM
  kakeis
GROUP BY DATE_FORMAT(use_date, '%Y')
ORDER BY DATE_FORMAT(use_date, '%Y') desc
    SQL


    @summary = Kakei.find_by_sql(sql)

    render :summary

  end

  private
  def kakei_params
    params.require(:kakei).permit(:use_date, :category_id, :naiyou, :kingaku, :credit_flag)
  end

  def display(from=Date.today)
    @categories = Category.all

    #@from = Time.now.at_beginning_of_month
    @from = from.at_beginning_of_month
    @to   = @from + 1.month
    @prev = @from - 1.day

    @kakeis = Kakei.where(use_date: @from...@to).order(:use_date, :category_id, :id)

    @summary = Hash.new
    @categories.each do |category|
      @summary.store(category.id, 0)
    end

    @new_kakei = Kakei.new(use_date: from)
  end

end
