module Subject
	def initialize
		@observers=[]
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end

	def notify_observers(product_id, session)
		@observers.each do |observer|
			observer.update(product_id, session)
		end
	end
end
