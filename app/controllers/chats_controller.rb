class ChatsController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/chats/:user_id" do
    begin
      User.find(params[:user_id]).chats.to_json
    rescue
      { error: "Couldn't find user with:user_id: #{params[:user_id]}" }.to_json
    end
  end

  get "/chat_members/:chat_id" do
    begin
      Chat.find(params[:chat_id]).users.to_json
    rescue
      { error: "Couldn't find chat with:chat_id: #{params[:chat_id]}" }.to_json
    end
  end

end