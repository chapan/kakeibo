class AddColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :deleted_at, :datetime
  end
end
