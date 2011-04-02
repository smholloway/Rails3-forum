class Comment < ActiveRecord::Base
  belongs_to :conversation

  validates :content, :presence => true

  default_scope :order => 'created_at DESC'
end
