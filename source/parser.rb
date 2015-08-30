require 'csv'
module CardParser
  def self.get_cards_from_file(filename)
    data = CSV.read(filename)
    data.map{|row| Card.new({term: row[0],definition: row[1]}) }
  end
end
