describe 'String' do

  describe "#titleize" do

    it "capitalizes each word in a string" do
      expect('this is my string'.titleize).to eq('This Is My String')
    end
    
    it "works with single-word strings" do
      expect('test'.titleize).to eq('Test')
    end
    
    it "capitalizes all uppercase strings" do
      expect('TEST'.capitalize).to eq('Test')
    end
    
    it "capitalizes mixed-case strings" do
      expect('ThIs to BE capITlizEd'.capitalize).to eq('This to be capitlized')
    end
    
  end
  
  describe '#blank?' do

    it "returns true if string is empty" do
      expect('').to be_blank  # this is a predicate matcher
      # similar to above is
      # expect(''.blank?).to be true
    end

    it "returns true if string contains only spaces" do
      expect('      ').to be_blank
    end

    it "returns true if string contains only tabs" do
      # Get a tab using a double-quoted string with \t
      # example: "\t\t\t"
      expect("\t\t").to be_blank
    end

    it "returns true if string contains only spaces and tabs" do
      expect("\t     \t\t   \t\t\t    ").to be_blank
    end
    
    it "returns false if string contains a letter" do
      expect("   a     \t\t\t   \t").not_to be_blank
    end

    it "returns false if string contains a number" do
      expect("   3  \t").not_to be_blank
    end
    
  end
  
end
