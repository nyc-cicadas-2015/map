require_relative 'model'
require_relative 'view'

class Controller
  attr_reader :model, :view
  def initialize(args = {})
    @model = args[:model]
    @view = args[:view]
  end

  def run
    view.welcome
    until model.game_over?
      puts model.pull_definition
      view.user_text
      3.times do
        guess = $stdin.gets.chomp
        if model.checker?(guess)
          view.correct_response
          break
        else
          view.incorrect_response
        end
      end
      model.move_card
    end
    view.goodbye
  end
end

ARGV.empty? ? filename = './flashcard_decks/flashcard.txt' : filename = './flashcard_decks/' + ARGV[0]
model = Game.new(CardParser.get_cards_from_file(filename))
view = FlashcardView.new

Controller.new({model: model, view: view}).run


