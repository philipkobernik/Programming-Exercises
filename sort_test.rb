if Kernel.respond_to?(:require_relative)
  require_relative 'sort'
else
  require 'sort'
end

require 'test/unit'

class SortTest < Test::Unit::TestCase
  def test_sorted_array
    
      a = Sort.new
      
      assert_equal([1,2,3,4,5], a.selection_sort([1,2,3,4,5]))
      
  end
  
  def test_array_of_one
    a = Sort.new
    
    assert_equal([2], a.selection_sort([2]))
  end
  
  def test_array_in_reverse
    a = Sort.new
    
    assert_equal([1,2,3,4,5,6,7,8,9], a.selection_sort([9,8,7,6,5,4,3,2,1]))
    
  end
  
  def test_array_with_repeats
    
    a = Sort.new
    
    assert_equal([1,1,1,2,2,2,3,3,3], a.selection_sort([3,2,2,1,3,2,1,1,3]))
  end
  
  def test_empty_array
    
    a = Sort.new
    
    assert_equal([], a.selection_sort([]))
  end
  

end
