class CreateKakeis < ActiveRecord::Migration
  def change
    create_table :kakeis do |t|
      t.date :use_date, null: false
      t.integer :category_id, index: true
      t.string :naiyou, null: false
      t.integer :kingaku, null: false
      t.integer :credit_flag, default: 0

      t.timestamps null: false
    end
  end
end
