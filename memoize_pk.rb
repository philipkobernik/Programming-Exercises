# module Memoize defines method #remember that stores the state of the method specified,
# then dynamically rewrites that method using define_method.
# The re-written method, if need be, can call the original method by binding it to self
#
# LIKE: don't have to use alias_method to 'hide' the original method. Module makes re-use easy. Interface is nice and concise.
# DISLIKE: replacing the original method feels un-safe (brazen) to me
#
module Memoize

  def remember(method)

    original_method = instance_method(method)
    memory = {}

    define_method(method) do |*args|

      if memory.has_key?(args)
        memory[args]
      else
        bound_method = original_method.bind(self)
        memory[args] = bound_method.call(*args)
      end
    end
  end
end

class Discounter
  extend Memoize

  def discount(*skus)
    expensive_calculation(*skus)
  end

  remember :discount

  private

  def expensive_calculation(*skus)
    puts "performing expensive calc on #{skus}"
    skus.inject(:+)
  end
end


d = Discounter.new

puts d.discount(1, 2, 3)
puts d.discount(1, 2, 3)
puts d.discount(3, 4, 3)
puts d.discount(3, 4, 3)
