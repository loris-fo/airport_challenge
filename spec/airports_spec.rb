require 'planes'
require 'airports'

describe Airports do

	let(:airport){Airports.new}
	let(:plane){double :plane}
	let(:nice_weather){double :nice_weather, storm: false}
	let(:bad_weather){double :bad_weather, storm: true}

	context 'traffic control' do

		it 'should accept a landing plane' do
	   		airport.park(plane)
  	 		expect{airport.park(plane)}.to change{airport.number_of_planes}.by 1
		end
	
		it 'should accept a leaving plane' do
			airport.park(plane)
			expect{airport.leaving_plane(plane)}.to change{airport.number_of_planes}.by -1
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
		
		context 'nice_weather' do
		
			it 'should accept a landing plane when the weather is sunny' do
				expect{airport.authorized_landing(plane)}.to change{airport.number_of_planes}.by 1
			end
	
		end

		context 'bad_weather' do

			it 'should not accept a landing plane when a storm is brewing' do
				expect{airport.unauthorized_landing(plane)}.to change{airport.number_of_planes}.by 0
			end


		end
	end
end
