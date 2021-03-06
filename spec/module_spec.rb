require_relative '../source/parser.rb'
require_relative '../source/model.rb'

describe CardParser do
let(:cards_from_csv) {CardParser.get_cards_from_file('flashcard.txt')}
  describe "#get_cards_from_file" do
    it "returns an Array" do
      expect(cards_from_csv).to be_a_kind_of(Array)
    end

    it "should return Car objects in the Array" do
      expect(cards_from_csv.first).to be_a_kind_of(Card)
    end
  end
end
