class Conversation < ActiveRecord::Base
  belongs_to :forum
  has_many :comments
end
