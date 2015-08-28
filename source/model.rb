require_relative 'dealership'

describe Car do
  let(:test_car) {Car.new(make: "Honda", inventory_number: "55839", model: "Accord", year: "2001")}
  describe "#initialize" do
    it "initializes a new Car class with 4 attributes" do
      expect(test_car.inventory_number).to eq("55839")
      expect(test_car.model).to eq("Accord")
      expect(test_car.year).to eq("2001")
    end
  end
end

describe CarLoader do
  describe "#get_cars_from_csv" do
    it "returns an array of Car objects" do
      expect(CarLoader.get_cars_from_csv('inventory.csv')).to be_an(Array)
    end
  end
end

describe Dealership do
  let(:cars) {[ Car.new(make: "Honda", inventory_number: "55839", model: "Accord", year: "2001"),
                Car.new(make: "Toyota", inventory_number: "98773", model:"Corolla", year:"2004"),
              ]}

  let(:dealership) { Dealership.new(cars)}

  describe "#find_make" do
    it "finds all cars of a given make" do
      expect(dealership.find_make("Honda").size).to eq(1)
    end

    it "returns an empty array when there are no cars of the given make" do
      expect(dealership.find_make("Blah").empty?).to eq(true)
    end
  end

  describe "#newest_car" do
    it "returns the newest car based on year" do
      expect(dealership.newest_car.year).to eq("2004")
    end
  end

  describe "#previous_year" do
    it "returns all cars made before user specified year" do
      expect(dealership.previous_year("2000").size).to eq(0)
    end
  end

  describe "#post_year" do
    it "returns all cars after user specified year" do
      expect(dealership.post_year("2000").size).to eq(2)
    end
  end
end
