class Character < ActiveRecord::Base
  belongs_to :guild
  belongs_to :user
  validates_uniqueness_of :name
  accepts_nested_attributes_for :guild
  validate :character_exists
  validate :guild_is_registered
  before_save :set_guild
  after_save :fetch_stats!
  
  def stats
    @stats ||= Stat.where(character_id:  self.id).last
  end
  
  def character_exists
    self.errors.add_to_base "Character does not exist on specified realm" unless WowCommunityApi::Character.find_by_realm_and_name(self.realm, self.name)
  end
  
  def guild_is_registered
    guild_name = WowCommunityApi::Character.find_by_realm_and_name(self.realm, self.name, "guild").guild.name
    self.errors.add_to_base "Character's guild is not registered" unless Guild.where(['LOWER(name) = LOWER(?)', guild_name]).first
  end

  def set_guild
    guild_name = WowCommunityApi::Character.find_by_realm_and_name(self.realm, self.name, "guild").guild.name
    self.guild = Guild.where(['LOWER(name) = LOWER(?)', guild_name]).first
  end
  
  def check_and_remove_guild!
    if self.guild.name != WowCommunityApi::Character.find_by_realm_and_name(self.realm, self.name, "guild").guild.name
      self.destroy
    end
  end

  def fetch_stats!
    if stats =  WowCommunityApi::Character.find_by_realm_and_name(self.realm, self.name, "stats")
      if self.stats
        self.stats.update_attributes stats.stats.marshal_dump
      else
        new_stats = Stat.new
        new_stats.character_id = self.id
        new_stats.update_attributes stats.stats.marshal_dump
        new_stats.save
      end
    end
  end
end
