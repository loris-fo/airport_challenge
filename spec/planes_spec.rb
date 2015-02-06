require 'planes'

describe Planes do
	
	let(:planes){Planes.new}

	it 'should be able to fly' do
		expect(planes).to be_flying
	end

	it 'should be able to land' do
		expect(planes.land!).not_to be_flying
	end

	it 'should be able to take off' do
		expect(planes.take_off!).to be_flying
	end
end
