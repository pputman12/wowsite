class Character < ActiveRecord::Base
  belongs_to :guild
  belongs_to :user
  validates_uniqueness_of :name
  def self.get_stats(character)
      
    db = Mongo::Connection.new.db("mydb")
    coll = db.collection("#{character.name}Collection") 
    coll.find_one()
  end
end
