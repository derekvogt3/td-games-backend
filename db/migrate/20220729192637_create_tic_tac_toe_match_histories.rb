class CreateTicTacToeMatchHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :tic_tac_toe_match_histories do |t|
      t.integer :match_id
      t.timestamps
      t.string :player
      t.integer :position
      t.integer :user_id
    end
  end
end
