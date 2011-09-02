task :stats => :environment do
  @characters = Character.all
  @characters.each do |character|
    if struct =  WowCommunityApi::Character.find_by_realm_and_name(character.realm, character.name, "stats")
      struct = struct.marshal_dump 
      stats = struct[:stats].marshal_dump
      db = Mongo::Connection.new.db("mydb")
      coll = db.collection("#{character.name}Collection")

      coll.insert(stats)
    end
  end
end

 
