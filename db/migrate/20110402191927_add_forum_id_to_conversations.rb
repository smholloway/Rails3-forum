class AddForumIdToConversations < ActiveRecord::Migration
  def self.up
    add_column :conversations, :forum_id, :integer
  end

  def self.down
    remove_column :conversations, :forum_id
  end
end
