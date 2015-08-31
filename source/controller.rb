require_relative 'model'
require_relative 'view'

class Controller
  attr_reader :model, :view
  def initialize(args = {})
    @model = args[:model] #unclear as to which model. Is this a game, perhaps?
    @view = args[:view]
  end

  def run
    first_run
    run_again
  end

  def first_run
    view.welcome
    until model.game_over?
      # looks like we might be able to put this in the Game model
      # The act of running a game, comparing user input to our data
      # and calling for user input from the view are things that
      # the Game model should be doing.

      #no 'puts'ing in the controller. This is a View action
      puts model.pull_definition


      view.user_text
      counter = 0
      3.times do # if you use a placeholder variable here (3.times do |i|) i is a counter.
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
# nice composition here
Controller.new({model: model, view: view}).run
