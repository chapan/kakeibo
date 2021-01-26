# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Category.create(name:"食費", sort: 1)
# Category.create(name:"交通費", sort: 2)
# Category.create(name:"書籍", sort: 3)
# Category.create(name:"娯楽", sort: 4)
# Category.create(name:"雑費", sort: 5)
# Category.create(name:"諸生活費", sort: 6)
# Category.create(name:"返済", sort: 7)
# Category.create(name:"収入", sort: 8)
GoldBar.create(enemy_id: 1, name:"つよばは" )
GoldBar.create(enemy_id: 2, name:"あるばは" )
GoldBar.create(enemy_id: 3, name:"黒黄" )
GoldBar.create(enemy_id: 4, name:"アーカーシャ／グランデ" )

GoldBarHistory.create(name: "あるばは", box: "赤箱", drop_date: "2018-08-25")
GoldBarHistory.create(name: "あるばは", box: "金箱", drop_date: "2019-01-01")
GoldBarHistory.create(name: "黒黄", box: "赤箱", drop_date: "2020-01-01")
GoldBarHistory.create(name: "つよばは", box: "赤箱", drop_date: "2021-01-02")
GoldBarHistory.create(name: "あるばは", box: "赤箱", drop_date: "2021-01-16")
