task :fetch_wow_stats => :environment do
  Character.find_each do |character|
    character.fetch_stats!
    character.self.check_and_remove_guild!
  end
end

 
