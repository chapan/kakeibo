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

FactoryBot.define do
  factory :category do

  end

end
