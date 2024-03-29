class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :name
      t.text :context

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
