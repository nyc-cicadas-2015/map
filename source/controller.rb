require_relative 'model'

game = Game.new(CardParser.get_cards_from_file("flashcard.txt"))

puts "Welcome to the best flashcard game ever!"

until game.game_over?
  puts game.pull_definition
  puts "Provide a term ..blah blah blah"

  3.times do
    guess = gets.chomp
    if game.checker?(guess)
      puts "Woo hoo! You are correct!"
      break
    else
      puts "Boo hoo! You are wrong."
    end
  end

  game.move_card
end

puts "Thanks for playing."
