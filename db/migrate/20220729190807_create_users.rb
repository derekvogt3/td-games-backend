class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :profile_img
      t.boolean :is_login, default: true
      t.string :in_match
      t.timestamps
    end
  end
end
