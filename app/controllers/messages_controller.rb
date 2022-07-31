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

  post "/messages" do
    message = Message.create(params)
    message.to_json
  end
end
