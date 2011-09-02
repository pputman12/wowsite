class Character < ActiveRecord::Base
  belongs_to :guild
  belongs_to :user
  validates_uniqueness_of :name
  def self.get_stats(character)
  
    @stats = Stat.where(character_id:  character.id).last
  end
end
