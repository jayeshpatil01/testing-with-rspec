require 'restaurant'

describe Restaurant do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  let(:crescent) { Restaurant.new(:name => 'Crescent', :cuisine => 'paleo', :price => '321') }
  
  describe 'attributes' do
  
    it "allow reading and writing for :name" do
      subject.name = 'test'
      expect(subject.name).to eq('test')
    end

    it "allow reading and writing for :cuisine" do
      subject.cuisine = 'test'
      expect(subject.cuisine).to eq('test')
    end

    it "allow reading and writing for :price" do
      subject.price = 20.00
      expect(subject.price).to eq(20.00)
    end
    
  end
  
  describe '.load_file' do

    it 'does not set @@file if filepath is nil' do
      no_output { Restaurant.load_file(nil) }
      expect(Restaurant.file).to be_nil
    end
    
    it 'sets @@file if filepath is usable' do
      no_output { Restaurant.load_file(test_file) }
      expect(Restaurant.file).not_to be_nil
      expect(Restaurant.file.class).to be(RestaurantFile)
      expect(Restaurant.file).to be_usable
    end

    it 'outputs a message if filepath is not usable' do
      expect do
        Restaurant.load_file(nil)
      end.to output(/not usable/).to_stdout
    end
    
    it 'does not output a message if filepath is usable' do
      expect do
        Restaurant.load_file(test_file)
      end.not_to output.to_stdout
    end
    
  end
  
  describe '.all' do
    
    it 'returns array of restaurant objects from @@file' do
      Restaurant.load_file(test_file)
      restaurants = Restaurant.all
      expect(restaurants.class).to be(Array)
      expect(restaurants.length).to eq(6)
      expect(restaurants.first.class).to be(Restaurant)
    end

    it 'returns an empty array when @@file is nil' do
      no_output { Restaurant.load_file(nil) }
      restaurants = Restaurant.all
      expect(restaurants).to eq([])
    end
    
  end
  
  describe '#initialize' do

    context 'with no options' do
      # subject would return the same thing
      let(:no_options) { Restaurant.new }

      it 'sets a default of "" for :name' do
        expect(no_options.name).to eq("")
      end

      it 'sets a default of "unknown" for :cuisine' do
        expect(no_options.cuisine).to eq('unknown')
      end

      it 'does not set a default for :price' do
        expect(no_options.price).to be_nil
      end
    end
    
    context 'with custom options' do

      let(:options) { Restaurant.new(:name => 'Samosa', :cuisine => 'Indian', :price => 20) }
      
      it 'allows setting the :name' do
        expect(options.name).to eq('Samosa')
      end

      it 'allows setting the :cuisine' do
        expect(options.cuisine).to eq('Indian')
      end

      it 'allows setting the :price' do
        expect(options.price).to eq(20)
      end

    end

  end
  
  describe '#save' do

    it 'returns false if @@file is nil' do
      # Don't load a file here
      # OR load file like 
      # no_output { Restaurant.load_file(nil) }
      expect(Restaurant.file).to be_nil
      expect(crescent.save).to be false
    end
    
    it 'returns false if not valid' do
      Restaurant.load_file(test_file)
      expect(Restaurant.file).not_to be_nil

      # subject will be invalid by default
      expect(subject.valid?).to be false
    end
    
    it 'calls append on @@file if valid' do
      Restaurant.load_file(test_file)
      expect(Restaurant.file).not_to be_nil

      # Message expection on partial test double
      expect(Restaurant.file).to receive(:append).with(crescent)
      crescent.save
    end
    
  end
  
  describe '#valid?' do
  
    it 'returns false if name is nil' do
      restaurant = Restaurant.new(:name => nil)
      expect(restaurant.valid?).to be false
    end

    it 'returns false if name is blank' do
      restaurant = Restaurant.new(:name => '')
      expect(restaurant.valid?).to be false
    end

    it 'returns false if cuisine is nil' do
      restaurant = Restaurant.new(:cuisine => nil)
      expect(restaurant.valid?).to be false
    end

    it 'returns false if cuisine is blank' do
      restaurant = Restaurant.new(:cuisine => '')
      expect(restaurant.valid?).to be false
    end
    
    it 'returns false if price is nil' do
      restaurant = Restaurant.new(:price => nil)
      expect(restaurant.valid?).to be false
    end

    it 'returns false if price is 0' do
      restaurant = Restaurant.new(:price => 0)
      expect(restaurant.valid?).to be false
    end
    
    it 'returns false if price is negative' do
      restaurant = Restaurant.new(:price => -20)
      expect(restaurant.valid?).to be false
    end

    it 'returns true if name, cuisine, price are present' do
      restaurant = Restaurant.new(:cuisine => 'Indian', :name => 'Samosa', :price => 20)
      expect(restaurant.valid?).to be true
    end
    
  end

end
