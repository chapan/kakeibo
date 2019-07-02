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
#

class Tweet < ApplicationRecord
  validates :tweet_id, presence: true
  validates :body, presence: true
  validates :tweeted_at, presence: true
end
