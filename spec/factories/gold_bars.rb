# == Schema Information
#
# Table name: gold_bars
#
#  id          :bigint           not null, primary key
#  enemy_id    :integer
#  name        :string(255)
#  total_count :integer          default(0)
#  red_box     :integer          default(0)
#  gold_box    :integer          default(0)
#  blue_box    :integer          default(0)
#  eikan       :integer          default(0)
#  hagyo       :integer          default(0)
#  shigoku     :integer          default(0)
#  gold_bar    :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :gold_bar do
    name { "MyString" }
  end
end
