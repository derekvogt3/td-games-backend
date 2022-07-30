class UsersController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/users" do
    User.all.to_json
  end

  get "/users/:id" do
    begin
      user = User.find(params[:id])
      user.to_json
    rescue
      { error: "Couldn't find data with id: #{params[:id]}" }.to_json
    end
  end

  post "/users" do
    begin
      user = User.create(params)
      user.to_json
    rescue
      { error: "Fail to create user" }.to_json
    end
  end

end