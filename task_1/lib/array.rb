class Array

	def inject_2
		memo ||= self.shift
		self.each { |element| memo = yield(memo, element) }
		memo
	end

end
