require_relative 'subject'

class Eventlistener
	include Subject
	attr_accessor :commentcount

	def initialize()
		super()
	end


	def run(product_id, session)
		notify_observers(product_id, session)
	end

end
