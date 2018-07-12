# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  sort       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  usage      :integer          default("1")
#

FactoryGirl.define do
  factory :category do
    name "MyString"
sort 1
  end

end
