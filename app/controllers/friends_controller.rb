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

  get "/friends_relation" do
    begin
      Relation.find_by(user_id: params[:user_id], friend_id: params[:friend_id]).to_json
    rescue
      { error: "Couldn't find relation" }.to_json
    end
  end

  get "/accept_relations" do
    begin
      r1 = Relation.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
      r2 = Relation.find_by(user_id: params[:friend_id], friend_id: params[:user_id])
      r1.update(status: "accepted")
      r2.update(status: "accepted")
      [r1, r2].to_json
    rescue
      { error: "Couldn't find relation" }.to_json
    end
  end

  delete "/delete_relations" do
    begin
      r1 = Relation.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
      r2 = Relation.find_by(user_id: params[:friend_id], friend_id: params[:user_id])
      if params[:method] == "delete"
        r1.delete
        r2 ? r2.delete : nil
        {}.to_json
      elsif params[:method] == "decline"
        r1.delete
        r2.update(status: "declined")
        r2.to_json
      end
    rescue
      { error: "Couldn't find relation" }.to_json
    end
  end

  post "/friend_invite" do
    begin
      friend = User.find_by(username: params[:friend])
      if friend != nil
        if params[:user_id] == friend.id
          return { result: "Cannot add yourself as friend!"}.to_json
        end
        
        declined = Relation.find_by(user_id: friend.id, friend_id: params[:user_id], status: "declined")
        if declined != nil
          declined.delete
          r1 = Relation.create(user_id: params[:user_id], friend_id: friend.id, invited_by: params[:user_id])
          r2 = Relation.create(user_id: friend.id, friend_id: params[:user_id], invited_by: params[:user_id])
          return { result: "Friend invite sent to #{params[:friend]}" }.to_json
        end
        
        already_added = Relation.find_by(user_id: params[:user_id], friend_id: friend.id)
        if already_added != nil
          if already_added.status == "accepted"
            return { result: "User already in your friend list"}.to_json
          elsif already_added.status == "pending"
            return { result: "Already have a pending friend request for this user"}.to_json
          elsif already_added.status == "declined"
            return { result: "This user declined your last invitation, you need to cancel that before you send a new one."}.to_json
          end
        else
          r1 = Relation.create(user_id: params[:user_id], friend_id: friend.id, invited_by: params[:user_id])
          r2 = Relation.create(user_id: friend.id, friend_id: params[:user_id], invited_by: params[:user_id])
          return { result: "Friend invite sent to #{params[:friend]}" }.to_json
        end
      else
        { result: "User not found" }.to_json
      end
    rescue
      { error: "Couldn't send invite" }.to_json
    end
  end
end