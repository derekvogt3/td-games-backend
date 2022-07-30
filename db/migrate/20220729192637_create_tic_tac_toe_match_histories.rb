class CreateTicTacToeMatchHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :tic_tac_toe_match_histories do |t|
      t.text :history
      t.integer :match_id
      t.timestamps
    end
  end
end
