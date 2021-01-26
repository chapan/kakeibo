# == Schema Information
#
# Table name: gold_bar_histories
#
#  id        :bigint           not null, primary key
#  name      :string(255)
#  box       :string(255)
#  drop_date :date
#

class GoldBarHistory < ApplicationRecord
  validates :name, presence: true
  validates :box, presence: true

end
