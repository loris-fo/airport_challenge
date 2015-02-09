require 'planes'

describe Plane do
	
	let(:plane) {Plane.new}

	context 'when created' do
		it 'is flying' do
			expect(plane).to be_flying
		end

		it 'has a flying status' do
			expect(plane.status).to eq :flying
		end
	end

	context 'taking off' do
		it 'should be able to take off' do
			expect(plane.take_off!).to be_flying
		end

		it 'changes the flying status to flying' do
			
		end
	end


		context 'landing' do
		  it 'should be able to land' do
			  expect(plane.land!).not_to be_flying
		  end
		end
end

