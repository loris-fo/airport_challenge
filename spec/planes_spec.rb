require 'planes'

describe Planes do
	
	let(:planes){Planes.new}

	it 'should have a flying status when created' do
		expect(planes).to be_flying
	end

	it 'should be able to take off' do
		expect(planes.take_off!).to be_flying
	end

	it 'has a flying status when it\'s in the air' do
		planes.in_the_air!
		expect(planes.in_the_air!).to be_flying
	end

	it 'should be able to land' do
		planes.in_the_air!
		planes.land!
		expect(planes.land!).not_to be_flying
	end




	# it 'should be able to change its status after taking off' do
	# end
end

