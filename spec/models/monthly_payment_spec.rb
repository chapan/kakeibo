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

require 'rails_helper'

RSpec.describe MonthlyPayment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
