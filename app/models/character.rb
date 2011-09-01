class Character < ActiveRecord::Base
  belongs_to :guild
  belongs_to :user
  has_one :stats
  accepts_nested_attributes_for :stats
end
