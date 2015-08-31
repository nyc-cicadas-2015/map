require_relative 'parser' # I don't think we're using this in this file

class Card
  attr_reader :term, :definition
  def initialize(args={})
    @term = args[:term] # set defaults. always a good habit to get into
    @definition = args[:definition]
  end
end


class Game
  attr_reader :unseen_cards, :correct_cards, :incorrect_cards

  def initialize(deck)
    @unseen_cards = deck
    @correct_cards = []
    @incorrect_cards = []
  end

  def pull_definition
    unseen_cards[0].definition
  end

  def pull_term
    unseen_cards[0].term
  end

  def checker?(guess)
    guess == unseen_cards[0].term
  end

  def game_over?
    unseen_cards.empty?
  end

  def reset_cards
    @unseen_cards = @incorrect_cards
  end

  def move_correct_cards
    correct_cards << unseen_cards.shift
  end

  def move_incorrect_cards
    incorrect_cards << unseen_cards.shift
  end

end
