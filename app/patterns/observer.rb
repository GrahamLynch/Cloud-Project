
class Observer
  def update(changed_subject)
    puts "The subject has changed."
  end
end

class Subject
        attr_accessor :name

        def initalize
          @observers = []
        end

        def add_observer(observer)
		    @observers << observer
	      end

        def detach_observer(observer)
         @observers = observer
       end

       def notify_observers(observer)
            @observers.each { |observer| observer.update(self) }
            end
       end


observer_a = Observer.new
observer_b = Observer.new
subject = Subject.new

# Let's give the subject a name
subject.name = "Anakin Skywalker"

# Next, we'll attach the two observers
# to the subject.
subject.add_observer(observer_a)
subject.add_observer(observer_b)

# Then, we'll change the state of the
# subject.
subject.name = "Obi Wan Kenobi"

# Finally, we'll notify the observers
# that some change has occured.
subject.notify_observers
