class CreateUsersMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :users_matches do |t|
      t.integer :match_id
      t.integer :user_id
      t.integer :friend_id
      t.integer :invited_by
      t.string :status, default: "pending"
      t.string :diffculty, default: "normal"
      t.timestamps
    end
  end
end
