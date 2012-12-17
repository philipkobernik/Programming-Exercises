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

# defines a method #memoize that dynamically creates a subclass of 'klass' and defines a method
# that will return a dictionary value or call super to memoize the result
#
# Like: separation of concerns
# Dislike: interface -- creating objects via the memoize method feels strange
#
def memoize klass, method
  Class.new(klass) do
    memory = {}

    define_method method do |*args|
      if memory.has_key?(args)
        memory[args]
      else
        memory[args] = super(*args)
      end
    end
  end

end


d = memoize(Discounter, :discount).new

puts d.discount(1, 2, 3)
puts d.discount(1, 2, 3)
puts d.discount(3, 4, 3)
puts d.discount(3, 4, 3)
