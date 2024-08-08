# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it "correctly formats an integer" do
        val = number_to_currency(200)
        expect(val).to eq('$200.00')
      end

      it "correctly formats a float" do
        val = number_to_currency(2.345)
        expect(val).to eq('$2.34')
      end

      it "correctly formats a string" do
        val = number_to_currency('34.354')
        expect(val).to eq('$34.35')
      end
      
      it "uses delimiters for very large numbers" do
        val = number_to_currency(34575415458752)
        expect(val).to eq('$34,575,415,458,752.00')
      end

      it "does not have delimiters for small numbers" do
        val = number_to_currency(25.0)
        expect(val).to eq('$25.00')
      end

    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit' do
        val = number_to_currency(15, {:unit => '€'})
        expect(val).to eq('€15.00')
      end

      it 'allows changing the :precision' do
        val = number_to_currency(45.546751, {:precision => 3})
        expect(val).to eq('$45.546')
      end
      
      it 'omits the separator if :precision is 0' do
        val = number_to_currency(75.45841, {:precision => 0})
        expect(val).to eq('$75')
      end
      
      it 'allows changing the :delimiter' do
        val = number_to_currency(675452, {:delimiter => '-'})
        expect(val).to eq('$675-452.00')
      end
      
      it 'allows changing the :separator' do
        val = number_to_currency(675452, {:separator => '*'})
        expect(val).to eq('$675,452*00')
      end
            
      it 'correctly formats using multiple options' do
        val = number_to_currency('6754521.75486424', {:separator => '-', :delimiter => '*', :precision => 4, :unit => '¥'})
        expect(val).to eq('¥6*754*521-7548')
      end
      
    end
    
  end
  
end
