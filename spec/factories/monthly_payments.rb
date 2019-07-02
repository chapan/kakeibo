# == Schema Information
#
# Table name: monthly_payments
#
#  id          :bigint           not null, primary key
#  category_id :integer          not null
#  naiyou      :string(255)      not null
#  kingaku     :integer          not null
#  credit_flag :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :monthly_payment do
    category_id { 1 }
    naiyou { "MyString" }
    kingaku { 1 }
    credit_flag { 1 }
  end
end
