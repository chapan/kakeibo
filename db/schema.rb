# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_26_023932) do

  create_table "gold_bar_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", comment: "敵の名前"
    t.string "box", comment: "箱名"
    t.date "drop_date", comment: "入手日"
  end

  create_table "gold_bars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "enemy_id", comment: "敵のID"
    t.string "name", comment: "敵の名前"
    t.integer "total_count", default: 0, comment: "討伐数"
    t.integer "red_box", default: 0, comment: "ヒヒイロカネ(赤箱)"
    t.integer "gold_box", default: 0, comment: "ヒヒイロカネ(金箱)"
    t.integer "blue_box", default: 0, comment: "青箱"
    t.integer "eikan", default: 0, comment: "栄冠(青箱)"
    t.integer "hagyo", default: 0, comment: "覇業(青箱)"
    t.integer "shigoku", default: 0, comment: "至極(青箱)"
    t.integer "gold_bar", default: 0, comment: "ヒヒイロカネ(青箱)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kakeis", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.date "use_date", null: false
    t.integer "category_id"
    t.string "naiyou", null: false
    t.integer "kingaku", null: false
    t.integer "credit_flag", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_kakeis_on_category_id"
  end

  create_table "monthly_payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "naiyou", null: false
    t.integer "kingaku", null: false
    t.integer "credit_flag", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_monthly_payments_on_category_id"
  end

  create_table "tweets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tweet_id"
    t.text "body", collation: "utf8mb4_general_ci"
    t.datetime "tweeted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "error"
    t.index ["tweet_id"], name: "index_tweets_on_tweet_id", unique: true
  end

end
