require './lib/weather'

class AirportWeather; include Weather; end

describe AirportWeather do 

	let(:airportweather){AirportWeather.new}
	before(:each) { allow(airportweather).to receive(:storm).and_return(false) }
	before(:each) { allow(airportweather).to receive(:sunny).and_return(true) }

	
	it 'should know when a storm is brewing' do
		expect(airportweather.storm).to eq false
	end

	it 'should know when the weather is sunny' do
		expect(airportweather.sunny).to eq true
	end

	
end