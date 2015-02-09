module Weather

	attr_reader :storm
	attr_reader :sunny

	def storm
		rand <= 0.8 ? true : false
	end

	def sunny
		rand <=0.8 ? true : false
	end

end