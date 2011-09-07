class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  belongs_to :guild
end
