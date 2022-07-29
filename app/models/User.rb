class User < ActiveRecord::Base
  has_many :users_matches
  has_many :matches, through: :users_matches
  has_many :games, through: :matches
  has_many :tic_tac_toe_match_histories, through: :matches
end