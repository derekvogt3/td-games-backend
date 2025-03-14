class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :game_id
      t.text :game_settings
      t.text :game_status
      t.boolean :finished, default: false
      t.timestamps
    end
  end
end
