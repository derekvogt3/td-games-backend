class Match < ActiveRecord::Base
  belongs_to :game

  has_many :tic_tac_toe_match_histories
  has_many :users, through: :tic_tac_toe_match_histories

  has_many :chats
end