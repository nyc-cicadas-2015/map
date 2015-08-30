require 'colorize'

class FlashcardView
  def welcome
    system("clear")
    puts "*".red * 80
    puts "Welcome to the best flashcard game ever!".red
    puts "*".red * 80
  end

  def user_text
    puts "Please type your answer: ".yellow
  end

  def correct_response
    puts "Woo hoo! You are correct!".green
  end

  def incorrect_response
    puts "Boo hoo! You are wrong.".red
  end

  def goodbye
    puts "Thanks for playing."
  end
end
