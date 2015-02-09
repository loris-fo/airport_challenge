require 'planes'

describe Planes do
	
	let(:planes){Planes.new}

	context 'taking off and landing' do
		
		it 'should have a flying status when created' do
			expect(planes).to be_flying
		end

		it 'should be able to take off' do
			expect(planes.take_off!).to be_flying
		end

		it 'should have a flying status when it\'s in the air' do
			planes.in_the_air!
			expect(planes.in_the_air!).to be_flying
		end

		it 'should be able to land' do
			planes.in_the_air!
			planes.land!
			expect(planes.land!).not_to be_flying
		end
	end
end

