class AddConversationIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :conversation_id, :integer
  end

  def self.down
    remove_column :comments, :conversation_id
  end
end
