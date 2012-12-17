class Discounter
  def discount(*skus)
    expensive_calculation(*skus)
  end

  private

  def expensive_calculation(*skus)
    puts "performing expensive calc on #{skus}"
    skus.inject(:+)
  end
end

# method memoize creates a ghost class and uses class_eval to inject a method into it
# dynamically created method is automatically a subclass of whatever object is passed in
#
# Like: seperate concerns, not coupled
# Dislike:
#
def memoize object, method
  ghost = class << object; self; end
  ghost.class_eval do
    memory ||= {}

    define_method(method) do |*args|
      if memory.has_key?(args)
        memory[args]
      else
        memory[args] = super(*args)
      end
    end
  end
end

d = Discounter.new
memoize d, :discount

puts d.discount(1, 2, 3)
puts d.discount(1, 2, 3)
puts d.discount(3, 4, 3)
puts d.discount(3, 4, 3)
