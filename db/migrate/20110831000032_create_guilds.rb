class CreateGuilds < ActiveRecord::Migration
  def self.up
    create_table :guilds do |t|
      t.string :name
      t.string :faction
      t.string :realm
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :guilds
  end
end
