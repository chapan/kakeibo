# == Schema Information
#
# Table name: kakeis
#
#  id          :integer          not null, primary key
#  use_date    :date             not null
#  category_id :integer
#  naiyou      :string(255)      not null
#  kingaku     :integer          not null
#  credit_flag :integer          default("0")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Kakei < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
#  belongs_to :category

  validates :use_date, presence: true
  validates :category, presence: true
  validates :naiyou, presence: true
  validates :kingaku, presence: true

end
