puts "🌱 Seeding spices..."

# Seed your database here

User.create(username: "tony", password: "1450575459", profile_img: "https://cdn.vox-cdn.com/thumbor/AaMw8bQMRhPOeiTy-ldtOKt9nfc=/0x38:1920x1043/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/23601546/diabloimmortal.png") #123456
User.create(username: "derek", password: "92599395", profile_img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrBpTMNtfNhdBZVYuyad_lzcD0C3vKeiy1oA&usqp=CAU") #abcde
User.create(username: "alan", password: "1724788940") #iforget


Game.create(title: "Tic Tac Toe", image_url: "https://m.media-amazon.com/images/I/61kjGo7vPtL._AC_SX679_.jpg", description: "X O X O X" )
Game.create(title: "Collect 4", image_url: "https://www.ultraboardgames.com/connect4/gfx/banner2.jpg" )
Game.create(title: "Reversi", image_url: "https://playpager.com/wp-content/uploads/2019/08/reversi-game.jpg" )

Match.create(game: Game.first)

UsersMatch.create(match: Match.first, user: User.first,  friend_id:User.second.id, invited_by:User.first.id)
UsersMatch.create(match: Match.first, user: User.second, friend_id:User.first.id, invited_by:User.first.id)


Chat.create()
UsersChat.create(chat: Chat.first, user: User.first)
UsersChat.create(chat: Chat.first, user: User.second)

Message.create(chat: Chat.first, user: User.first, message: "Lets play a game Derek.")
Message.create(chat: Chat.first, user: User.second, message: "No, I want to go to concert.")

Relation.create(user: User.first, friend_id: User.second.id, invited_by: User.first.id, status: "accepted")
Relation.create(user: User.second, friend_id: User.first.id, invited_by: User.first.id, status: "accepted")
Relation.create(user: User.first, friend_id: User.third.id, invited_by: User.first.id, status: "accepted")
Relation.create(user: User.third, friend_id: User.first.id, invited_by: User.first.id, status: "accepted")
Relation.create(user: User.second, friend_id: User.last.id, invited_by: User.second.id, status: "accepted")
Relation.create(user: User.last, friend_id: User.second.id, invited_by: User.first.id, status: "accepted")


puts "✅ Done seeding!"
