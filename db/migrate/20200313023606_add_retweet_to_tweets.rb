class AddRetweetToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :retweet, :integer, default: 0
  end
end
