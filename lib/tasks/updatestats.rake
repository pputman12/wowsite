task :fetch_wow_stats => :environment do
  Character.find_each do |character|
    character.fetch_stats!
  end
end

 
