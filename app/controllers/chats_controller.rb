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

  get "/find_chats" do
    begin
      arr1 = UsersChat.where(user_id: params[:user_id]).map{|chat| chat[:chat_id]}
      arr2 = UsersChat.where(user_id: params[:friend_id]).map{|chat| chat[:chat_id]}
      results = arr1 & arr2
      if results.length > 0
        results.each do |r|
          chat = Chat.find(r)
          if chat.group_type == "pair"
            return chat.to_json
          end
        end
      end
      chat = Chat.create()
      UsersChat.create(chat: chat, user_id: params[:user_id])
      UsersChat.create(chat: chat, user_id: params[:friend_id])
      chat.to_json
    rescue
      { error: "Couldn't find chat" }.to_json
    end
  end

end
