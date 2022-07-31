class FriendsController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/friends/:id" do
    begin
      User.find(params[:id]).friends.to_json
    rescue
      { error: "Couldn't find user with id: #{params[:id]}" }.to_json
    end
  end

  get "/friends_pending/:id" do
    begin
      User.find(params[:id]).friends_pending.to_json
    rescue
      { error: "Couldn't find user with id: #{params[:id]}" }.to_json
    end
  end

  post "/friend_invite" do
    begin
      friend = User.find_by(username: params[:friend])
      if friend
        already_added = Relation.find_by(user_id: params[:user_id], friend_id: friend.id)
        if already_added
          if already_added.accepted == "accepted"
            { result: "User already in your friend list"}.to_json
          elsif already_added.accepted == "pending"
            { result: "Already have a pending friend request for this user"}.to_json
          end
        else
          r1 = Relation.create(user_id: params[:user_id], friend_id: friend.id, invited_by: params[:user_id])
          r2 = Relation.create(user_id: friend.id, friend_id: params[:user_id], invited_by: params[:user_id])
          { result: "invite sent" }.to_json
        end
      else
        { reuslt: "user not found" }.to_json
      end
    rescue
      { error: "Couldn't send invite" }.to_json
    end
  end
end