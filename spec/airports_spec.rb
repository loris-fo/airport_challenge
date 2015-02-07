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
	
	it 'should be able to release a plane that is taking off' do
		airport.park(plane)
		expect(airport.number_of_planes).to eq(1)
		airport.release(plane)
		expect(airport.number_of_planes).to eq(0)
	end

	it 'should know when the airport is full' do
		20.times{airport.park(plane)}
		expect(airport).to be_full
	end

	it 'should not accept a landing plane if the airport is full' do
		20.times{airport.park(plane)}
		expect{airport.park(plane)}.to raise_error 'the airport is full'
	end

end
