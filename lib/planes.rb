class Plane

	def initialize
		@flying = true
		@status = :flying
	end
		
	def status
		@status
	end

	def flying?
		@flying
	end

	def land!
		@flying = false
		self
	end

	def take_off!
		@flying = true
		self
	end

end
