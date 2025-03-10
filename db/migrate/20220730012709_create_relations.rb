class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :relations do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :invited_by
      t.string :status, default: "pending"
      t.timestamps
    end
  end
end
