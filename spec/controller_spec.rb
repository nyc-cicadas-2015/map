require_relative '../source/controller.rb'
let(:card1) {Card.new({term: "alias", definition: "To create a second name for the variable or method."})}
let(:card2) {Card.new({term: "and", definition: "A command that appends two or more objects together."})}
let(:my_game) {Game.new([card1, card2])}

describe Game do

  describe '#initialize' do
    it 'should contain an array for unseen cards' do
      expect(my_game.unseen_deck).to be_a_kind_of(Array)
    end

    it 'should contain an array of card objects' do
      expect(my_game.unseen_deck.first).to be_a_kind_of(Card)
    end

    it 'should contain an array for seen cards' do
      expect(my_game.seen_deck).to be_a_kind_of(Array)
    end

    it 'should initialize the seen cards array as empty' do
      expect(my_game.seen_deck).to be_empty
    end
  end

  describe '#pull_definition' do
    it 'should return definition as a string' do
      expect(my_game.pull_definition).to be_a_kind_of(String)
    end

    it 'should return the first card in the deck' do
      expect(my_game.pull_definition).to eq("To create a second name for the variable or method.")
    end
  end
end
