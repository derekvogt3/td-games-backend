class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.integer :user_id
      t.string :message
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
