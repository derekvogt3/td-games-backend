class UsersChat < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat
end