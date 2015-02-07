class Airports

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

	def release(plane)
		@planes.delete(plane)
	end

	def full?
		number_of_planes == capacity
	end

end	