require 'planes'
require 'airports'

describe Airport do

	let(:luton)        { Airport.new                        }
	let(:plane)        { double :plane                      }
	let(:nice_weather) { double :nice_weather, storm: false }
	let(:bad_weather)  { double :bad_weather, storm: true   }

	context 'on good weather' do
		before(:each) do
			allow(luton).to receive(:storm).and_return(false)
		end

		it 'can land a plane' do
			expect(plane).to receive(:land!)
			luton.park(plane)
		end

		it 'parks the plane after landing' do
			allow(plane).to receive(:land!)
  	 	expect{luton.park(plane)}.to change{luton.number_of_planes}.by 1
		end

		it 'A plane can take off' do 
			expect(plane).to receive(:take_off!)
			luton.leaving_plane(plane)
			
		end

		it 'should accept a leaving plane' do
			allow(plane).to receive(:land!)
			luton.park(plane)
			allow(plane).to receive(:take_off!)
			expect{luton.leaving_plane(plane)}.to change{luton.number_of_planes}.by (-1)
		end

	end

	context 'on bad weather' do
		before(:each) do
			allow(luton).to receive(:storm).and_return(true)
		end

			it 'should not accept a landing plane when a storm is brewing' do
				expect{luton.unauthorized_landing(plane)}.to change{luton.number_of_planes}.by 0
			end

			it 'should not accept a leaving plane when a storm is brewing' do
				expect{luton.unauthorized_leaving(plane)}.to change{luton.number_of_planes}.by 0
			end

	end


	context 'traffic control' do

		it 'should know when the airport is full' do
			allow(plane).to receive(:land!)
			luton.capacity.times{luton.park(plane)}
			expect(luton).to be_full
		end

		it 'should not accept a landing plane if the airport is full' do
			allow(plane).to receive(:land!)
			luton.capacity.times{luton.park(plane)}
			expect{luton.park(plane)}.to raise_error 'the airport is full'
		end
	
	end

end