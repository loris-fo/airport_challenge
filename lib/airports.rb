require_relative 'weather'
class Airport
	include Weather

	DEFAULT_CAPACITY = 6

	def planes
		@planes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def number_of_planes
		planes.count
	end

	def park(plane)
		raise 'the airport is full' if full?
		planes << plane.land!
	end

	def leaving_plane(plane)
		planes.delete(plane.take_off!)
	end

	def full?
		number_of_planes == capacity
	end

	def authorized_landing(plane)
		@planes << plane if storm == false		
	end
	
	def unauthorized_landing(plane)
		@planes == number_of_planes if storm == true
	end

	def authorized_leaving(plane)
		@planes.delete(plane) if storm == false
	end

	def unauthorized_leaving(plane)
		@planes == number_of_planes if storm == true
	end

end	