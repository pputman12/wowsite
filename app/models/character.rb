class Character < ActiveRecord::Base
  belongs_to :guild
  belongs_to :user
end
