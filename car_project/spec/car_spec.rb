require_relative '../lib/car'
require_relative 'shared_examples/a_standard_vehicle'

describe Car do

  describe 'attributes' do

    # before(:example) do
    #   def car
    #     @car ||= Car.new
    #   end
    # end
    # This is was let actually doese

    # Do not need subject explicitly-defined
    # if we use a classname after describe
    # subject { Car.new }

    # use "subject" instead of "let"
    # if variable is subject of example
    # let(:car) { Car.new }   # lazy initialization 
    # let!(:car) { Car.new }  # eager initializes

    # "let" is better than "before" for setting up instance variables
    # before(:example) do
    #   @car = Car.new
    # end

    it_behaves_like('a standard vehicle')

    it 'allows reading and writing for :doors' do
      subject.doors = 1
      expect(subject.doors).to eq(1)
    end
  end

  describe '#initialize' do
    it 'defaults to 4 doors' do
      expect(subject.doors).to eq(4)
    end

    it 'it allows setting new number of doors' do
      car = Car.new(:doors => 2)
      expect(car.doors).to eq(2)
    end

    it 'defaults to 4 if option is neither 2 or 4' do
      door_counts = []
      [0,1,3,5,6].each do |n|
        car = Car.new(:doors => n)
        door_counts << car.doors
      end
      expect(door_counts).to all( eq(4) )
    end
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

  describe "#coupe?" do
    it 'returns true if it has 2 doors' do
      car = Car.new(:doors => 2)
      expect(car.coupe?).to be true
    end

    it 'returns false if it does not have 2 doors' do
      car = Car.new(:doors => 4)
      expect(car.coupe?).to be false
    end
  end

  describe "#sedan?" do
    it 'returns true if it has 2 doors' do
      car = Car.new(:doors => 4)
      expect(car.sedan?).to be true
    end

    it 'returns false if it does not have 2 doors' do
      car = Car.new(:doors => 2)
      expect(car.sedan?).to be false
    end
  end

end
