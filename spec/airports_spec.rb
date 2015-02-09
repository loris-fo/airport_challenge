require 'planes'
require 'airports'

describe Airports do

	let(:airport){Airports.new}
	let(:plane){Planes.new}

	context 'traffic control' do

		it 'should accept a landing plane' do
  	 		expect(airport.number_of_planes).to eq(0)
	   		airport.park(plane)
  	 		expect(airport.number_of_planes).to eq(1)
		end
	
		it 'should accept a leaving plane' do
			airport.park(plane)
			expect(airport.number_of_planes).to eq(1)
			airport.leaving_plane(plane)
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

	context 'weather conditions' do
		it 'should accept a landing plane when the weather is sunny' do
			expect(airport.number_of_planes).to eq(0)
			airport.sunny
			airport.authorized_landing(plane)
			expect(airport.number_of_planes).to eq(1)
		end

		it 'should not accept a landing plane when a storm is brewing' do
			expect(airport.number_of_planes).to eq (0)
			airport.storm
			airport.unauthorized_landing(plane)
			expect(airport.number_of_planes).to eq (0)
		end
	end
end
