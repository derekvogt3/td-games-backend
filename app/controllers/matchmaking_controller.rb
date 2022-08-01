class FriendsController < Sinatra::Base

    post "/create_game" do

        UsersMatch.create_match_invite(params[:user_id],params[:game_id],params[:friend_id]).to_json

      end

end