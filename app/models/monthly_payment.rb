# == Schema Information
#
# Table name: monthly_payments
#
#  id          :bigint(8)        not null, primary key
#  category_id :integer          not null
#  naiyou      :string(255)      not null
#  kingaku     :integer          not null
#  credit_flag :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MonthlyPayment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :category, presence: true
  validates :naiyou, presence: true
  validates :kingaku, presence: true
end
