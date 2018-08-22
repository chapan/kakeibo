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

  extend Enumerize
  enumerize :category_id, in: {
      syokuhi: 1,
      koutsu: 2,
      book: 3,
      goraku: 4,
      social_game: 9,
      zappi: 5,
      seikatsu: 6,
      shunyu: 7,
      other_shunyu: 10,
      hensai: 8,
  }, predicates: true


  self.data = [
      {id: category_id.syokuhi.value, name: '食費',  usage: 1, sort: 10},
      {id: category_id.koutsu.value, name: '交通費',usage: 1, sort: 20},
      {id: category_id.book.value, name: '書籍',  usage: 1, sort: 30},
      {id: category_id.goraku.value, name: '娯楽',  usage: 1, sort: 40},
      {id: category_id.social_game.value, name: 'ソシャゲ',  usage: 1, sort: 45},
      {id: category_id.zappi.value, name: '雑費',  usage: 1, sort: 50},
      {id: category_id.seikatsu.value, name: '諸生活費', usage: 1, sort: 60},
      {id: category_id.shunyu.value, name: '収入',  usage: 1, sort: 70},
      {id: category_id.other_shunyu.value, name: 'その他収入',  usage: 0, sort: 75},
      {id: category_id.hensai.value, name: '返済',  usage: 1, sort: 80},
  ]

end
