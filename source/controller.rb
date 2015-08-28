require 'colorize'
require_relative 'model'
filename = "flashcard_test.txt"
game = Game.new(CardParser.get_cards_from_file(filename))

puts "Welcome to the best flashcard game ever!"

until game.game_over?
  puts "Definition".yellow
  puts game.pull_definition
  puts "Please type your answer".blue

  3.times do
    guess = gets.chomp
    if game.checker?(guess)
      puts "Woo hoo! You are correct!".green
      break
    else
      puts "Boo hoo! You are wrong.".red
      # prompt again
    end
  end

  game.move_card
end

puts "Thanks for playing."
