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
    self.relations.filter {|r| r.status == "accepted"}.map {|r| User.find(r[:friend_id])}
  end

  def friends_pending
    self.relations.filter {|r| r.status != "accepted"}.map {|r| User.find(r[:friend_id])}
  end

  def unread_messages
    self.chats.map {|chat| chat.messages.where("read = ? AND user_id != ?", FALSE, "#{self.id}")}.flatten
  end
end