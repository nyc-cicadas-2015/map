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

describe Game do
  let (:cards) {[Card.new(term: "alias", definition: "To create a second name for the variable or method." ),
               Card.new(term: "BEGIN", definition: "Designates code that must be run unconditionally at the beginning of the program before any other."),
               Card.new(term: "begin", definition: "Delimits a 'begin' block of code, which can allow the use of while and until in modifier position with multi-line statements."),
               Card.new(term: "break", definition: "Gives an unconditional termination to a code block, and is usually placed with an argument."),
               Card.new(term: "case", definition: "starts a case statement; this block of code will output a result and end when it's terms are fulfilled, which are defined with when or else.")]}

  let (:other_cards) {[Card.new(term: "class", definition: "Opens a class definition block, which can later be reopened and added to with variables and even functions.")]}

  let (:new_game) {Game.new(cards)}

  let (:other_game) {Game.new(other_cards)}

  describe "#initialize" do
    it "instantiate a new game class with an array" do
        expect(new_game.unseen_cards).to be_an(Array)
      end

    it "the array contains card objects" do
        expect(new_game.unseen_cards[0]).to be_a(Card)
      end

    it "instantiate a new game class with an array" do
        expect(new_game.seen_cards).to be_an(Array)
      end

    it "that is empty" do
        expect(new_game.seen_cards[0]).to eq(nil)
      end
  end

  describe "#pull_definition" do
    it "returns card definition as a string" do
        expect(new_game.pull_definition).to be_a(String)
      end

    it "and returns the definition of the first card object" do
        expect(new_game.pull_definition).to eq("To create a second name for the variable or method.")
      end
  end

  describe "#pull_term" do
    it "returns card term as a string" do
        expect(new_game.pull_term).to be_a(String)
      end

    it "and returns the term of the first card object" do
        expect(new_game.pull_term).to eq("alias")
      end
  end

  let(:guess){"alias"}
  describe "#checker?" do
    it "returns a boolean" do
        expect(new_game.checker?(guess)).to eq(true)
      end
  end

  describe "#game_over?" do
    it "tests if the all of the questions have been asked by testing if the unseen_cards array is empty" do
      expect(other_game.game_over?).to eq(false)
    end
  end

  describe "#move_card" do
    it "delete card at poistion 0 from unseen_cards" do
      expect{other_game.move_card}.to change{other_game.unseen_cards.length}.from(1).to(0)
    end

     it "push current card into seen_cards" do
      expect{other_game.move_card}.to change{other_game.seen_cards.length}.from(0).to(1)
         # require 'pry'; binding.pry
    end
  end

end
