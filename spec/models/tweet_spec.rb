# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  tweet_id   :bigint
#  body       :text(65535)
#  tweeted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  error      :string(255)
#

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
