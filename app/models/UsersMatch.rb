class UsersMatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :match



  def create_match(user_id,game_id)

    Match.create(game_id:)

    UsersMatch.create()


  end
end
