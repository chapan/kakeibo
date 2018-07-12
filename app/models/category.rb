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

# class Category < ActiveRecord::Base
# end

class Category < ActiveHash::Base
  self.data = [
      {id: 1, name: '食費',  usage: 1, sort: 10},
      {id: 2, name: '交通費',usage: 1, sort: 20},
      {id: 3, name: '書籍',  usage: 1, sort: 30},
      {id: 4, name: '娯楽',  usage: 1, sort: 40},
      {id: 9, name: 'ソシャゲ',  usage: 1, sort: 45},
      {id: 5, name: '雑費',  usage: 1, sort: 50},
      {id: 6, name: '諸生活費', usage: 1, sort: 60},
      {id: 7, name: '収入',  usage: 1, sort: 70},
      {id: 10, name: 'その他収入',  usage: 0, sort: 75},
      {id: 8, name: '返済',  usage: 1, sort: 80},
  ]

end
