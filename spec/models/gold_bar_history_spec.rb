# == Schema Information
#
# Table name: gold_bar_histories
#
#  id        :bigint           not null, primary key
#  name      :string(255)
#  box       :string(255)
#  drop_date :date
#

require 'rails_helper'

RSpec.describe GoldBarHistory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
