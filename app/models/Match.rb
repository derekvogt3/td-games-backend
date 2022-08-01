class Match < ActiveRecord::Base
  belongs_to :game

  has_many :tic_tac_toe_match_histories
  has_many :users_matches
  has_many :users, through: :users_matches

  has_many :chats
end