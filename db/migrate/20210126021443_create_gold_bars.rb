class CreateGoldBars < ActiveRecord::Migration[5.2]
  def change
    create_table :gold_bars do |t|
      t.integer :enemy_id, comment: "敵のID"
      t.string :name, comment: "敵の名前"
      t.integer :total_count, default: 0, comment: "討伐数"
      t.integer :red_box, default: 0, comment: "ヒヒイロカネ(赤箱)"
      t.integer :gold_box, default: 0, comment: "ヒヒイロカネ(金箱)"
      t.integer :blue_box, default: 0, comment: "青箱"
      t.integer :eikan, default: 0, comment: "栄冠(青箱)"
      t.integer :hagyo, default: 0, comment: "覇業(青箱)"
      t.integer :shigoku, default: 0, comment: "至極(青箱)"
      t.integer :gold_bar, default: 0, comment: "ヒヒイロカネ(青箱)"

      t.timestamps
    end
  end
end
