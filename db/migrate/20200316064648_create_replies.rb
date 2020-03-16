class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.string :content
      t.integer :repliable_id
      t.string :repliable_type

      t.timestamps
    end
  end
end
