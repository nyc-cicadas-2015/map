require_relative 'parser'

class Card
  attr_reader :term, :definition
  def initialize(args={})
    @term = args[:term]
    @definition = args[:definition]
  end
end


class Deck
  attr_reader :deck
  def initialize(deck=[])
    @deck = deck
  end

end
