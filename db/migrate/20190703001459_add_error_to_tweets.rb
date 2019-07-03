class AddErrorToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :error, :string
  end
end
