class Character < ActiveRecord::Base
  belongs_to :guild
  belongs_to :user
  validates_uniqueness_of :name
  accepts_nested_attributes_for :guild
  def stats
    @stats ||= Stat.where(character_id:  self.id).last
  end
end
