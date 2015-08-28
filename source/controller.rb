class Game
  attr_reader :deck
  def initialize(deck)
    @deck = deck
  end

  def pull_card
  end

  def game_over?
  end

  def track_guesses
  end

  def correct?
  end

end

new_game = Game.new(my_deck)
new_game.pull_card
