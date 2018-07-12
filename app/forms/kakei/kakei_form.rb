class Kakei::KakeiForm < FormObject

  def initialize
    @categories = Category.all.order(:sort)

    from = Time.now.at_beginning_of_month
    to   = from + 1.month

    @kakeis = Kakei.where(use_date: from...to).includes(:category).order(:use_date, :category_id)

  end
end