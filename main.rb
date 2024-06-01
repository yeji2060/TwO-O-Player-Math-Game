require_relative 'player'
require_relative 'question'
require_relative 'game'

puts "Enter name for Player 1: "
player1_name = gets.chomp
player1 = Player.new(player1_name)

puts "Enter name for Player 2: "
player2_name = gets.chomp
player2 = Player.new(player2_name)

game = Game.new(player1, player2)
game.play 