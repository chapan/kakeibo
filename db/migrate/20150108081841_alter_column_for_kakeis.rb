class AlterColumnForKakeis < ActiveRecord::Migration
  def change
    change_column_null :kakeis, :category_id, null:false
  end
end
