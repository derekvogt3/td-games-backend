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

TicTacToeMatchHistory.create(match: Match.first, history: "[{'O': 1, 'player': 1}, {'X': 3, 'player: 2'}]")

Chat.create(match: Match.first)

UsersChat.create(chat: Chat.first, user: User.first)
UsersChat.create(chat: Chat.first, user: User.last)

Message.create(chat: Chat.first, user: User.first, message: "Lets play a game Derek.")
Message.create(chat: Chat.first, user: User.last, message: "I want to go home.")

Relation.create(user: User.first, friend_id: User.second.id)
Relation.create(user: User.second, friend_id: User.first.id)
Relation.create(user: User.first, friend_id: User.third.id)
Relation.create(user: User.third, friend_id: User.first.id)
Relation.create(user: User.second, friend_id: User.last.id)
Relation.create(user: User.last, friend_id: User.second.id)


puts "✅ Done seeding!"
