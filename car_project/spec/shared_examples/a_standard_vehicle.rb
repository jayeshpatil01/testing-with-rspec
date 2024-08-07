shared_examples_for('a standard vehicle') do
  describe 'attributes' do
    it "allows reading and writing for :make" do
      subject.make = "Test"
      expect(subject.make).to eq("Test")
    end

    it "allows reading and writing for :year" do
      subject.year = 2005
      expect(subject.year).to eq(2005)
    end

    it "allows reading and writing for :color" do
      subject.color = 'Red'
      expect(subject.color).to eq('Red')
    end

    it "allows reading for wheels" do
      expect(subject.wheels).to eq(4)
    end

    it "allows writing for :doors"
  end
end
