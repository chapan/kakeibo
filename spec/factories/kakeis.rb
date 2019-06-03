# == Schema Information
#
# Table name: kakeis
#
#  id          :integer          not null, primary key
#  use_date    :date             not null
#  category_id :integer
#  naiyou      :string(255)      not null
#  kingaku     :integer          not null
#  credit_flag :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :kakei do

  end

end
