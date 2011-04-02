class Conversation < ActiveRecord::Base
  belongs_to :forum
  has_many :comments

  validates :title, :presence => true
  validates :description, :presence => true
end
