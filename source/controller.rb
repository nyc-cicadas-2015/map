require_relative 'model'
require_relative 'view'

class Controller
  attr_reader :model, :view
  def initialize(args = {})
    @model = args[:model]
    @view = args[:view]
  end

  def run
    first_run
    run_again
  end

  def first_run
    view.welcome
    until model.game_over?
      puts model.pull_definition
      view.user_text
      counter = 0
      3.times do
        guess = $stdin.gets.chomp
        if model.checker?(guess)
          model.move_correct_cards
          view.correct_response
          break
        else
          view.incorrect_response
          counter += 1
          puts "Attempt ##{counter}".yellow
        end
      end
      model.move_incorrect_cards if counter == 3
    end
  end

  def run_again
    model.reset_cards
    until model.game_over?
      view.review
      try_again = $stdin.gets.chomp
      if try_again.downcase == "yes"
        run
      else
        break
      end
    end
    view.goodbye
  end
end

ARGV.empty? ? filename = 'flashcard_test.txt' : filename = ARGV[0]
model = Game.new(CardParser.get_cards_from_file(filename))
view = FlashcardView.new

Controller.new({model: model, view: view}).run


