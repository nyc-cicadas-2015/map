require_relative 'model'
require_relative 'view'

class Controller

  def initialize(args = {})
    @model = args[:model]
    @view = args[:view]
  end

  def ask_question
    @view.definition_prompt
    puts @model.pull_definition
    @view.answer_prompt
  end

  def run
    @view.welcome
    until @model.game_over?
      ask_question

      3.times do

        guess = gets.chomp

        if @model.checker?(guess)
          @view.correct_response
          break
        else
          @view.incorrect_response
        end
      end
      @model.move_card
    end
    @view.goodbye
  end
end

# user_deck = ARGV[0]
# filename = user_deck ? user_deck : 'flashcard_test.txt'
# if ARGV[0] != nil
#   filename = 'flashcard_test.txt'
# else
#   filename = ARGV[0]
# end
filename = 'flashcard_test.txt'
model = Game.new(CardParser.get_cards_from_file(filename))
view = FlashcardView.new

Controller.new({model: model, view: view}).run
  #require 'pry'; binding.pry

