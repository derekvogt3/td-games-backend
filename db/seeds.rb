puts "🌱 Seeding spices..."

# Seed your database here

User.create(username: "tony", password: "1450575459") #123456
User.create(username: "derek", password: "92599395") #abcde
User.create(username: "alan", password: "1724788940") #iforget
User.create(username: "willie", password: "262288821") #itmakesense


Game.create(title: "Tic-Tac-Toe")

Match.create(game: Game.first)

UsersMatch.create(match: Match.first, user: User.first)
UsersMatch.create(match: Match.first, user: User.last)

# TicTacToeMatchHistory.create(match: Match.first, history: "[{'O': 1, 'player': 1}, {'X': 3, 'player: 2'}]")
TicTacToeMatchHistory.create(match: Match.first, history: "{player: 'X', position: 1, user_id: 1}")
TicTacToeMatchHistory.create(match: Match.first, history: "{player: 'O', position: 3, user_id: 2}")
TicTacToeMatchHistory.create(match: Match.first, history: "{player: 'X', position: 5, user_id: 1}")

Chat.create()
UsersChat.create(chat: Chat.first, user: User.first)
UsersChat.create(chat: Chat.first, user: User.last)
Chat.create()
UsersChat.create(chat: Chat.second, user: User.first)
UsersChat.create(chat: Chat.second, user: User.second)

Message.create(chat: Chat.first, user: User.first, message: "Lets play a game Derek.")
Message.create(chat: Chat.first, user: User.second, message: "No, I want to go to concert.")

Relation.create(user: User.first, friend_id: User.second.id, invited_by: User.first.id, accepted: true)
Relation.create(user: User.second, friend_id: User.first.id, invited_by: User.first.id, accepted: true)
Relation.create(user: User.first, friend_id: User.third.id, invited_by: User.first.id, accepted: true)
Relation.create(user: User.third, friend_id: User.first.id, invited_by: User.first.id, accepted: true)
Relation.create(user: User.second, friend_id: User.last.id, invited_by: User.second.id, accepted: true)
Relation.create(user: User.last, friend_id: User.second.id, invited_by: User.first.id, accepted: true)
Relation.create(user: User.first, friend_id: User.last.id, invited_by: User.first.id, accepted: false)
Relation.create(user: User.last, friend_id: User.first.id, invited_by: User.first.id, accepted: false)



puts "✅ Done seeding!"
