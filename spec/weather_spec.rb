require './lib/weather'

class AirportWeather; include Weather; end

describe AirportWeather do 

	let(:airportweather){AirportWeather.new}

	
	it 'should know when a storm is brewing' do
		expect(airportweather.stormy_weather?).to eq true
	end

	it 'should know when the weather is sunny' do
		expect(airportweather.stormy_weather?).to eq false
	end

	
end