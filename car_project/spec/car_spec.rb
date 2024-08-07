require_relative '../lib/car'

describe 'Car' do

  describe 'attributes' do

    # before(:example) do
    #   def car
    #     @car ||= Car.new
    #   end
    # end
    # This is was let actually doese

    let(:car) { Car.new }   # lazy initialization 
    # let!(:car) { Car.new }  # eager initializes

    # "let" is better than "before" for setting up instance variables
    # before(:example) do
    #   @car = Car.new
    # end

    it "allows reading and writing for :make" do
      car.make = "Test"
      expect(car.make).to eq("Test")
    end

    it "allows reading and writing for :year" do
      car.year = 2005
      expect(car.year).to eq(2005)
    end

    it "allows reading and writing for :color" do
      car.color = 'Red'
      expect(car.color).to eq('Red')
    end

    it "allows reading for wheels" do
      expect(car.wheels).to eq(4)
    end

    it "allows writing for :doors"
  end

  describe ".colors" do
    let(:colors) { ['blue', 'black', 'red', 'green'] }
    it "returs an array of colors" do
      expect(Car.colors).to match_array(colors)
    end
  end

  describe "#full_name" do

    let(:bmw) { Car.new({make: "BMW", year: 2024, color: "White"}) }
    let(:new_car) { Car.new }

    it "returns the full name string in exepcted format" do
      expect(bmw.full_name).to eq("2024 BMW (White)")
    end

    context "when initialized with no arguments" do
      it "return a full name string with default values" do
        expect(new_car.full_name).to eq("2007 Volvo (unknown)")
      end
    end
  end

end
