module Weather

	attr_reader :storm

	def storm
		rand <= 0.8 ? false : true
	end


end