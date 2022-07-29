class Chat < ActiveRecord::Base
  belongs_to :match
  has_many :messages

  has_many :users_chats
  has_many :users, through: :users_chats
end