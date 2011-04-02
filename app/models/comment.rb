class Comment < ActiveRecord::Base
  belongs_to :conversation
end
