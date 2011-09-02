task :stats => :environment do
  @characters = Character.all
  @characters.each do |character|

    if stats =  WowCommunityApi::Character.find_by_realm_and_name(character.realm, character.name, "stats")
      char_stats = WowCommunityApi::Character.find_by_realm_and_name(character.realm, character.name).marshal_dump
      stats = stats.marshal_dump 
      stats = stats[:stats].marshal_dump
      char_stats = char_stats.merge stats
      @stats = Stat.new
      @stats.character_id = character.id
      @stats.update_attributes char_stats
      @stats.save 
    end
  end
end

 
