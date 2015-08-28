include 'csv'
module CardParser
  def self.get_cards_from_file(filename)
    deck = []
    CSV.foreach(filename) do |row|
      deck << Card.new({term: row[0],definition: row[1]})
    end
    deck
  end
end
