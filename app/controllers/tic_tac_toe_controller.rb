class TicTacToeController < Sinatra::Base
# gets match data -> settings and the current history for initial game load
    get "/tic_tac_toe_match_data" do
        begin
            hash = Hash.new
            match = Match.find(params[:match_id])
#here we have an if statement to route to the match history for tic tac toe. Will need an if statement for each game

            if match.tic_tac_toe_match_histories.length > 0
                # match.update(game_status:'{"turn": 0, "board":[" ", " ", " ", " ", " ", " ", " ", " ", " "]}')
                # game_settings:"{playerX:#{match.users_matches[0].user_id},playerO:#{match.users_matches[0].friend_id}}")
                hash[:match] = match
                hash[:history] = match.tic_tac_toe_match_histories.last
                return hash.to_json
            else
                match.update(game_status:'{"board":[" ", " ", " ", " ", " ", " ", " ", " ", " "]}',
                    game_settings:'{"X":'+match.users_matches[0].user_id.to_s+',"O":'+match.users_matches[0].friend_id.to_s+'}')
                hash["match"] = match
                hash["history"] = "new game"
                return hash.to_json
            end


        rescue
            {error:"tic tac toe match data server error"}.to_json
        end
    end 

    get "/tic_tac_toe_match_last_history/:match_id" do
        begin
            Match.find(params[:match_id]).tic_tac_toe_match_histories.last.to_json
        rescue
            {error:"game status server error"}.to_json
        end
    end

    post "/tic_tac_toe_move" do
        begin
            TicTacToeMatchHistory.create(player:params[:player],position:params[:position],user_id:params[:user_id],match_id:params[:match_id])
            Match.find(params[:match_id]).update(game_status:params[:game_status])
            {success:"move successful"}.to_json
        rescue
            {error:"tic tac toe move server error"}.to_json
        end
    end

    patch "/tic_tac_toe_finished/:match_id" do
        begin
            m = Match.find(params[:match_id])
            m.update(finished: params[:finished])
            m.users_matches.each {|match| match.update(status: "finished")}
            {success:"Game finished!"}.to_json
        rescue
            {error:"tic tac toe move server error"}.to_json
        end
    end


end