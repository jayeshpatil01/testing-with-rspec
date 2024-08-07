require_relative '../lib/truck'
require_relative 'shared_examples/a_standard_vehicle'

describe Truck do

  describe 'attributes' do
    it_behaves_like('a standard vehicle')
  end

end
