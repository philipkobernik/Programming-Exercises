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

d = Discounter.new

def d.discount(*skus)
  @memory ||= {}

  if @memory.has_key?(skus)
    @memory[skus]
  else
    @memory[skus] = super(*skus)
  end

end

puts d.discount(1, 2, 3)
puts d.discount(1, 2, 3)
puts d.discount(3, 4, 3)
puts d.discount(3, 4, 3)
