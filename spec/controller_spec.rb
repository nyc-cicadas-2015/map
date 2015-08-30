require_relative '../source/controller.rb'
require_relative '../source/model.rb'

describe Controller do
  let(:model){Game.new(CardParser.get_cards_from_file('flashcard.txt'))}
  let(:view){FlashcardView.new}
  let(:test){Controller.new({:model=>model, :view=>view})}
  describe '#initialize' do
    it 'should instantiate a new Game class' do
      expect(model).to be_a(Game)
    end

    it 'should instantiate a new View class' do
    expect(view).to be_a(FlashcardView)
    end

    it 'should instantiate a new Controller class' do
    expect(test).to be_a(Controller)
    end
  end

  describe '#run' do
    it 'should display next question if user is correct' do
      expect{test.run}.to change{model.seen_cards.length}
    end

    it 'should not display next question if user is incorrect' do
      guess = "happy"
      expect(model.checker?(guess)).to eq(false)
    end
  end
end
