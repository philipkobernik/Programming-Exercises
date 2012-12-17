class Vector_rotation
  
  def self.rotate(word, num)
    return "" if word == "" || word == nil
    first = word.slice(0, num).reverse
    second = word.slice(num, word.length).reverse
    return (first+second).reverse
  end
  
end
