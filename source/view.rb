require 'colorize'

class FlashcardView
  def welcome
    puts "Welcome to the best flashcard game ever!"
  end

  def definition_prompt
    puts "Definition:".yellow
  end

  def answer_prompt
    puts "Please type your answer".blue
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
