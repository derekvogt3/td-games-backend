class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :group_type, default: "pair"
      t.timestamps
    end
  end
end
