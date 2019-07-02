class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.bigint :tweet_id
      t.text :body
      t.datetime :tweeted_at

      t.timestamps
    end
    add_index  :tweets, [:tweet_id], unique: true
  end
end
