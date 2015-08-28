require_relative 'parser'

class Card
  attr_reader :term, :definition
  def initialize(args={})
    @term = args[:term]
    @definition = args[:definition]
  end
end


class Game
  attr_reader :unseen_cards, :seen_cards

  def initialize(deck)
    @unseen_cards = deck
    @seen_cards = []
  end

end
