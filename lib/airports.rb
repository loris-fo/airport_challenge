class Airports

	def initialize
		@planes = []
	end

	def number_of_planes
		@planes.count
	end

	def park(plane)
		@planes << plane
	end

	
end	