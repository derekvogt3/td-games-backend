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
      { error: "Couldn't find user with id: #{params[:id]}" }.to_json
    end
  end

  get "/user_check/:name" do
    user = User.find_by(username: params[:name])
    if user
      { exist: true, id: user.id , is_login: user.is_login}.to_json
    else
      { exist: false }.to_json
    end
  end

  get "/password_check" do
    user = User.find_by(username: params[:name], password: params[:pw])
    if user
      { matched: true }.to_json
    else
      { matched: false }.to_json
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

  patch "/users/:id" do
    begin
      user = User.find(params[:id])
      user.update(params)
      user.to_json
    rescue
      { error: "Fail to update user" }.to_json
    end
  end

end