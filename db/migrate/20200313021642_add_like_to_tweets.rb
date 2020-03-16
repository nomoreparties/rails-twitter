class AddLikeToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :like, :integer, default: 0
  end
end
