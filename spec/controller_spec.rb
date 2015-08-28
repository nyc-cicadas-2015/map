require_relative '../source/controller.rb'
let(:card1) {Card.new({term: "alias", definition: "To create a second name for the variable or method."})}
let(:card2) {Card.new({term: "and", definition: "A command that appends two or more objects together."})}
let(:deck_of_cards) {Deck.new([card1, card2])}
let(:my_game) {Game.new(deck_of_cards)}

describe Game do
  describe '#initialize' do
    it 'should contain a deck of cards' do
      expect(my_game.deck).to be_a_kind_of(Deck)
    end

  end
end
