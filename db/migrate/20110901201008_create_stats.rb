class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :character_id
      t.integer :health
      t.string  :powerType
      t.string  :power
      t.integer :str
      t.integer :agi
      t.integer :sta
      t.integer :int
      t.integer :spr
      t.integer :attackPower
      t.integer :rangedAttackPower
      t.float   :mastery
      t.integer :masteryRating
      t.float   :crit
      t.integer :critRating
      t.float   :hitPercent
      t.integer :hitRating
      t.integer :hasteRating 
      t.integer :expertiseRating
      t.integer :spellPower
      t.integer :spellPen
      t.float   :spellCrit
      t.integer :spellCritRating
      t.float   :spellHitPercent
      t.integer :spellHitRating
      t.float   :mana5
      t.float :mana5Combat
      t.integer :armor
      t.float   :dodge
      t.integer :dodgeRating
      t.float   :parry
      t.integer :parryRating
      t.float   :block
      t.integer :blockRating
      t.integer  :resil
      t.float :mainHandDmgMin
      t.float :mainHandDmgMax
      t.float :mainHandSpeed
      t.float :mainHandDps
      t.integer :mainHandExpertise
      t.float :offHandDmgMin
      t.float :offHandDmgMax
      t.float :offHandSpeed
      t.float :offHandDps
      t.integer :offHandExpertise
      t.float :rangedDmgMin
      t.float :rangedDmgMax
      t.float :rangedSpeed
      t.float :rangedDps
      t.float :rangedCrit
      t.integer :rangedCritRating
      t.float :rangedHitPercent
      t.integer :rangedHitRating

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
