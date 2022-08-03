class TicTacToeMatchHistory < ActiveRecord::Base
  belongs_to :match
  has_one :user, through: :match
  
end