class Discounter
  def discount(*skus)
    expensive_calculation(*skus)
  end

  private

  def expensive_calculation(*skus)
    puts "performing expensive calc on #{skus}"
    return skus.inject(:+)
  end
end

class MemoDiscounter < Discounter
  def initialize
    @memory = {}
  end

  def discount(*skus)
    if @memory.has_key?(skus)
      @memory[skus]
    else
      @memory[skus] = super
    end
  end

end

d = MemoDiscounter.new
puts d.discount(1, 2, 3)
puts d.discount(1, 2, 3)
puts d.discount(3, 4, 3)
puts d.discount(3, 4, 3)
