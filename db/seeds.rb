puts "🌱 Seeding spices..."

# Seed your database here

User.create(username: "Tony", password: "123456")
User.create(username: "Derek", password: "abcde")

Game.create(title: "Tic-Tac-Toe")

Match.create(game: Game.first)

UsersMatch.create(match: Match.first, user: User.first)
UsersMatch.create(match: Match.first, user: User.last)

TicTacToeMatchHistory.create(match: Match.first, history: "[{'O': 1, 'player': 1}, {'X': 3, 'player: 2'}]")

puts "✅ Done seeding!"
