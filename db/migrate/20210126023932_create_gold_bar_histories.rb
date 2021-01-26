class CreateGoldBarHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :gold_bar_histories do |t|
      t.string :name, comment: "敵の名前"
      t.string :box, comment: "箱名"
      t.date :drop_date, comment: "入手日"

    end
  end
end
