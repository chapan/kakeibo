class Kakei::BaseKakeiController < BaseController
  before_action :set_title

  private
  def set_title
    @title = "家計簿"
  end
end