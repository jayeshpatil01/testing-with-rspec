require_relative '../car_project/lib/car'

describe 'Car' do

  describe 'attributes' do
    xit "allows reading and writing for :make" do
      car = Car.new
      car.make = "Test"
      expect(car.make).to eq("Test")
    end

    it "allows reading and writing for :year" do
      skip 'Debugging a problem'
      car = Car.new
      car.year = 2005
      expect(car.year).to eq(2005)
    end

    it "allows reading and writing for :color" do
      pending('Debugging a problem')
      car = Car.new
      car.color = 'Red'
      expect(car.color).to eq('Red1')
    end

    it "allows reading for wheels" do
      car = Car.new
      expect(car.wheels).to eq(4)
    end

    it "allows writing for :doors"
  end

  xdescribe ".colors" do
    it "returs an array of colors" do
      c = ['blue', 'black', 'red', 'green']
      expect(Car.colors).to match_array(c)
    end
  end

  describe "#full_name" do
    it "returns the full name string in exepcted format" do
      car = Car.new({make: "BMW", year: 2024, color: "White"})
      expect(car.full_name).to eq("2024 BMW (White)")
    end

    context "when initialized with no arguments" do
      it "return a full name string with default values" do
        car = Car.new
        expect(car.full_name).to eq("2007 Volvo (unknown)")
      end
    end
  end

end
