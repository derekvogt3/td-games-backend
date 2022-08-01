class UsersMatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :match


  def self.create_match_invite(user_id,game_id,friend_id)

    match = Match.create(game_id:game_id, finished: false)

    self.create(user_id:user_id,friend_id:friend_id,invited_by:user_id,match_id:match.id)
    self.create(user_id:friend_id,friend_id:user_id,invited_by:user_id,match_id:match.id)
    match

  end


end
