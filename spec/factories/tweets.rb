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

FactoryBot.define do
  factory :tweet do
    tweet_id { 1 }
    body { "MyText" }
    tweeted_at { "2019-06-28 10:04:44" }
  end
end
