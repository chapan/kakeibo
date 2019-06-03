class AlterColumnForKakeis < ActiveRecord::Migration
  def change
    change_column_null :kakeis, :category_id, false, 0
  end
end
