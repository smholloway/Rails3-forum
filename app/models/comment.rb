class Comment < ActiveRecord::Base
  belongs_to :conversation

  default_scope :order => 'created_at DESC'
end
