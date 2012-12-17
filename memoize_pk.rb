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

class Discounter
  alias_method :_original_discount_, :discount

  def discount(*skus)
    @memory ||= {}

    if @memory.has_key?(skus)
      @memory[skus]
    else
      @memory[skus] = _original_discount_(*skus)
    end
  end
end

d = Discounter.new

puts d.discount(1, 2, 3)
puts d.discount(1, 2, 3)
puts d.discount(3, 4, 3)
puts d.discount(3, 4, 3)
