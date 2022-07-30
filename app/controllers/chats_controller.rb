class ChatsController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/chats/:id" do
    begin
      User.find(params[:id]).chats.to_json
    rescue
      { error: "Couldn't find user with id: #{params[:id]}" }.to_json
    end
  end

end