class Forum < ActiveRecord::Base
  has_many :conversations
end
