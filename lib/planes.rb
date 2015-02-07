class Planes

	def initialize
		@flying_status = true
	end
		

	def in_the_air!
		@flying_status
		self
	end

	def flying?
		@flying_status
	end

	def land!
		@flying_status = false
		self
	end

	def take_off!
		@flying_status
		self
	end

end
