puts "🌱 Seeding spices..."

# Seed your database here

User.create(username: "Tony", password: "123456")
User.create(username: "Derek", password: "abcde")

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

puts "✅ Done seeding!"
