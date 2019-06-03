class CreateMonthlyPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :monthly_payments do |t|
      t.integer :category_id, null: false
      t.string :naiyou, null: false
      t.integer :kingaku, null: false
      t.integer :credit_flag, default: 0

      t.timestamps
    end
    add_index :monthly_payments, :category_id
  end
end
