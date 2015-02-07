require 'planes'
require 'airports'

describe Airports do

	let(:airport){Airports.new}
	let(:plane){Planes.new}

	it 'should be able to accept a landing plane' do
   expect(airport.number_of_planes).to eq(0)
   airport.park(plane)
   expect(airport.number_of_planes).to eq(1)
	end
=begin
	it 'should be able to release a plane that is taking off' do
	end

	it 'should not accept a landing plane if the airport is full' do
	end

	it 'should not accept to release a plane taking off is the airport is empty' do
	end
=end
end
