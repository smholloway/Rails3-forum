class Forum < ActiveRecord::Base
  has_many :conversations

  validates :title, :presence => true
  validates :description, :presence => true
end
