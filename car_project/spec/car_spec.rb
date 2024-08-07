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
