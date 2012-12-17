# module Memoize defines method #remember that takes a method name and a block.
# #remember turns the block into a method using define method. Then it turns that method into an object using instance_method.
# finally, it dynamically rewrites the original method using define_method.
# The re-written method, if need be, can call the original method by binding it to self
#
# LIKE: don't have to use alias_method to 'hide' the original method. Module makes re-use easy. Interface is even more concise.
# DISLIKE: replacing the original method feels a bit strange, but I'm warming up to it.
#
module Memoize

  def remember(method, &block)

    define_method(method, &block)

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

  remember :discount do |*skus|
    expensive_calculation(*skus)
  end

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
