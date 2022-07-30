class CreateUsersChats < ActiveRecord::Migration[6.1]
  def change
    create_table :users_chats do |t|
      t.integer :chat_id
      t.integer :user_id
      t.timestamps
    end
  end
end
