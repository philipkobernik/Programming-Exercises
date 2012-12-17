module Memoize

  def remember(method)
    original = "original #{method}"

    alias_method original, method

    memory = {}

    define_method(method) do |*args|

      if memory.has_key?(args)
        memory[args]
      else
        memory[args] = send "original #{method}", *args
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
