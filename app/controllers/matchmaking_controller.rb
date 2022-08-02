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
            {error:"all matches server error"}.to_json
        end
      end

    patch '/accept_invite' do 
      begin
        match = Match.find(params[:match_id]).users_matches.map do |users_match|
          users_match.update(status:"in match")
        end

        match.to_json

      rescue
        {error:"accept invite server error"}.to_json
        

      end

    end

    patch '/reject_invite' do 
      begin
        match = Match.find(params[:match_id]).users_matches.map do |users_match|
          users_match.update(status:"rejected")
        end

        match.to_json

      rescue
        {error:"reject invite server error"}.to_json
        

      end

    end

end