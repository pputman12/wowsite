class Stat
  include Mongoid::Document
  field :race,   :type => Integer
  field :class_id, :type => Integer
  field :level,    :type => Integer
  field :health, :type => Integer
  field :powerType, :type => String
  field :power, :type => Integer
  field :str, :type => Integer
  field :agi, :type => Integer
  field :sta, :type => Integer
  field :int, :type => Integer
  field :spr, :type => Integer
  field :attackPower, :type => Integer
  field :rangedAttackPower, :type => Integer
  field :master, :type => Float
  field :masteryRating, :type => Integer
  field :crit, :type => Float
  field :critRating, :type => Integer
  field :hitPercent, :type => Float
  field :hitRating, :type => Integer
  field :hasteRating, :type => Integer
  field :expertiseRating, :type => Integer
  field :spellPower, :type => Integer
  field :spellPen, :type => Integer
  field :spellCrit, :type => Float
  field :spellCritRating, :type => Integer
  field :spellHitPercent, :type => Float
  field :spellHitRating, :type => Integer
  field :mana5, :type => Float
  field :mana5Combat, :type => Float
  field :armor, :type => Integer
  field :dodge, :type => Float
  field :dodgeRating, :type => Integer
  field :parry, :type => Float
  field :parryRating, :type => Integer
  field :block, :type => Float
  field :blockRating, :type => Integer
  field :resil, :type => Integer
  field :mainHandDmgMin, :type => Float
  field :mainHandDmgMax, :type => Float
  field :mainHandSpeed, :type => Float
  field :mainHandDps, :type => Float
  field :mainHandExpertise, :type => Integer
  field :offHandDmgMin, :type => Float
  field :offHandDmgMax, :type => Float
  field :offHandSpeed, :type => Float
  field :offHandDps, :type => Float
  field :offHandExpertise, :type => Integer
  field :rangedDmgMin, :type => Float
  field :rangedDmgMax, :type => Float
  field :rangedSpeed, :type => Float
  field :rangedDps, :type => Float
  field :rangedCrit, :type => Float
  field :rangedCritRating, :type => Integer
  field :rangedHitPercent, :type => Float
  field :rangedHitRating, :type => Integer
  field :character_id, :type => Integer
  RACES = {
    6 => 'Undead',
    7 => 'Elven'
  }
  CLASS_IDS = {
    5 => 'Priest',
    6 => 'Test'
  }
  
  LABELS = {
    'health' => "Health",
    'agi'    => "Agility",
    'sta'    => "Stamina",
    'spr'    => "Spirit",
    'int'    => "Intelligence",
    'str'    => "Strength",
    'race'   => "Race",
    'class_id' => "Class"
  }
  
  def class_id
    CLASS_IDS[read_attribute(:class_id)]
  end
  
  def race
    RACES[read_attribute(:race)]
  end
end
