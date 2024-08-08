describe 'Doubles' do
  it 'allows stubbing methods' do
    dbl = double("Chant")
    allow(dbl).to receive(:hey!)
    expect(dbl).to respond_to(:hey!)
  end

  it 'allows stubbing a response with a block' do
    dbl = double("Chant")
    allow(dbl).to receive(:hey!) { 'Ho!' }
    expect(dbl.hey!).to eq('Ho!')
  end

  it 'allows stubbing responses with #and_return' do
    dbl = double("Chant")
    # This is my preferred syntax
    # When I say 'Hey!', you say 'Ho!'
    allow(dbl).to receive(:hey!).and_return('Ho!')
    # "Hey!", "Ho!"
    expect(dbl.hey!).to eq('Ho!')
  end

  it 'allow stubbing multiple methods with hash syntax' do
    dbl = double('Person')
    # Note this uses #receive_messages, not #receive
    allow(dbl).to receive_messages(:full_name => "John Doe", :initials => 'JAD')
    expect(dbl.full_name).to eq('John Doe')
    expect(dbl.initials).to eq('JAD')
  end

  it 'allows stubbing with a hash argument to #double' do
    dbl = double('Person', :full_name => "John Doe", :initials => 'JAD')
    expect(dbl.full_name).to eq('John Doe')
    expect(dbl.initials).to eq('JAD')
  end

  it 'allows stubbing multiple responses with #and_return' do
    die = double('Die')
    allow(die).to receive(:roll).and_return(1,3,5,2)
    expect(die.roll).to eq(1)
    expect(die.roll).to eq(3)
    expect(die.roll).to eq(5)
    expect(die.roll).to eq(2)
    expect(die.roll).to eq(2)     # continues returning last value
  end
end
