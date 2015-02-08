require_relative 'weather'
class Airports
	include Weather

	DEFAULT_CAPACITY = 20

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
		@planes << plane
	end

	def leaving_plane(plane)
		@planes.delete(plane)
	end

	def full?
		number_of_planes == capacity
	end

	def authorized_landing(plane)
		if storm == 'Sunny weather'
			@planes << plane
		else
			'A storm is brewing'
		end
	end
	
	def unauthorized_landing(plane)
		if storm == 'Storm brewing'
			'A storm is brewing'
		else
			@planes << plane
		end
	end

end	