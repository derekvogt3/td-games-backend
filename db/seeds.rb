puts "🌱 Seeding spices..."

# Seed your database here

User.create(username: "tony", password: "1450575459") #123456
User.create(username: "derek", password: "92599395") #abcde
User.create(username: "alan", password: "1724788940") #iforget
User.create(username: "willie", password: "262288821") #itmakesense


Game.create(title: "Tic Tac Toe", image_url: "https://m.media-amazon.com/images/I/61kjGo7vPtL._AC_SX679_.jpg", description: "X O X O X" )
Game.create(title: "Collect 4", image_url: "https://www.ultraboardgames.com/connect4/gfx/banner2.jpg" )
Game.create(title: "Reversi", image_url: "https://playpager.com/wp-content/uploads/2019/08/reversi-game.jpg" )

Match.create(game: Game.first)

UsersMatch.create(match: Match.first, user: User.first,  friend_id:User.second.id, invited_by:User.first.id)
UsersMatch.create(match: Match.first, user: User.second, friend_id:User.first.id, invited_by:User.first.id)

# TicTacToeMatchHistory.create(match: Match.first, history: "[{'O': 1, 'player': 1}, {'X': 3, 'player: 2'}]")
TicTacToeMatchHistory.create(match: Match.first, history: "{player: 'X', position: 1, user_id: 1}")
TicTacToeMatchHistory.create(match: Match.first, history: "{player: 'O', position: 3, user_id: 2}")
TicTacToeMatchHistory.create(match: Match.first, history: "{player: 'X', position: 5, user_id: 1}")

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
