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

require 'rails_helper'

RSpec.describe Category, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
