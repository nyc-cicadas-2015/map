require_relative '../source/model'

describe Card do
  let(:card) {Card.new(term: "alias", definition: "To create a second name for the variable or method." )}
  describe "#initialize" do
    it "initializes a new card object with a term attribute" do
      expect(card.term).to eq("alias")
    end

     it "initializes a new card object with a definition attribute" do
      expect(card.definition).to eq("To create a second name for the variable or method.")
    end
  end
end

describe Deck do
  let (:cards) {[Card.new(term: "alias", definition: "To create a second name for the variable or method." ),
               Card.new(term: "BEGIN", definition: "Designates code that must be run unconditionally at the beginning of the program before any other."),
               Card.new(term: "begin", definition: "Delimits a 'begin' block of code, which can allow the use of while and until in modifier position with multi-line statements."),
               Card.new(term: "break", definition: "Gives an unconditional termination to a code block, and is usually placed with an argument."),
               Card.new(term: "case", definition: "starts a case statement; this block of code will output a result and end when it's terms are fulfilled, which are defined with when or else.")]}

  let (:my_deck) {Deck.new(cards)}

  describe "#initialize" do
    it "instantiate a new deck class with an array" do
        expect(my_deck.deck).to be_an(Array)
      end


   it "the array contains card objects" do
        expect(my_deck.deck[0]).to be_a(Card)
      end
  end
end
