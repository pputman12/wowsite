class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.integer :user_id
      t.integer :guild_id
      t.integer :race
      t.integer :class_id
      t.integer :level
      t.integer :lastModified
      t.string :realm
      t.integer :gender
      t.integer :achievementPoints
      t.string :thumbnail
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
