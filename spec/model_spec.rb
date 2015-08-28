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
