class MessagesController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/messages" do
    begin
      Message.where(chat_id: params[:chat_id]).to_json
    rescue
      { error: "Couldn't find messages" }.to_json
    end
  end

  get "/messages_unread/:user_id" do
    User.find(params[:user_id]).unread_messages.to_json
  end

  post "/messages" do
    message = Message.create(params)
    message.to_json
  end

  patch "/messages/:id" do
    begin
      message = Message.find(params[:id])
      message.update(params)
      message.to_json
    rescue
      { error: "Fail to update message" }.to_json
    end
  end

  delete "/messages/:id" do
    begin
      message = Message.find(params[:id])
      message.delete
      {}.to_json
    rescue
      { error: "Fail to delete message" }.to_json
    end
  end
end
