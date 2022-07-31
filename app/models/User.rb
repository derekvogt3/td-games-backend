class User < ActiveRecord::Base
  has_many :users_matches
  has_many :matches, through: :users_matches
  has_many :games, through: :matches
  has_many :tic_tac_toe_match_histories, through: :matches
  has_many :users_chats
  has_many :chats, through: :users_chats
  has_many :messages
  has_many :relations
  
  def friends
    self.relations.filter {|r| r.accepted == "accepted"}.map {|r| User.find(r[:friend_id])}
  end

  def friends_pending
    self.relations.filter {|r| r.accepted == "pending"}.map {|r| User.find(r[:friend_id])}
  end
end