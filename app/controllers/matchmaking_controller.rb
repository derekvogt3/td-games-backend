class MatchMakingController < Sinatra::Base

    post "/create_game" do

        UsersMatch.create_match_invite(params[:user_id],params[:game_id],params[:friend_id]).to_json

      end

      get "/all_matches/:user_id" do

        begin

            array = Array.new

           User.find(params[:user_id]).users_matches.map do |matches|

            array << {usermatch:matches,friend:User.find(matches.friend_id)}
            

           end



           array.to_json

        rescue

            {error:"big error"}.to_json

        end



      end

end