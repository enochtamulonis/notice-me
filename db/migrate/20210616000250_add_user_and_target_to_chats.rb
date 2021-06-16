class AddUserAndTargetToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :user_id, :integer
    add_column :chats, :target_id, :integer
  end
end
