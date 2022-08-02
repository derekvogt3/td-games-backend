
  class GamesController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    # Add your routes here
    get "/games" do
      Game.all.to_json
    end

    get "/games/:id" do
      begin
        game = Game.find(params[:id])
        game.to_json
      rescue
        { error: "Couldn't find game with id: #{params[:id]}" }.to_json
      end
    end

  end