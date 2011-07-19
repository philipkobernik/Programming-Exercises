if Kernel.respond_to?(:require_relative)
  require_relative 'binary_search'
else
  require 'binary_search'
end

require 'test/unit'

class BinarySearchTest < Test::Unit::TestCase
  def test_empty_array
    
      a = BinarySearch.new
      assert_equal(-1, a.chop_it(3, []))
      
      #

      #

  end
  
  def test_array_of_one
    a = BinarySearch.new
    
    assert_equal(-1, a.chop_it(3, [1]))
    assert_equal(0,  a.chop_it(1, [1]))
  end
  
  def test_array_of_three
    a = BinarySearch.new
    
    assert_equal(0,  a.chop_it(1, [1, 3, 5]))
    assert_equal(1,  a.chop_it(3, [1, 3, 5]))
    assert_equal(2,  a.chop_it(5, [1, 3, 5]))
    assert_equal(-1, a.chop_it(0, [1, 3, 5]))
    assert_equal(-1, a.chop_it(2, [1, 3, 5]))
    assert_equal(-1, a.chop_it(4, [1, 3, 5]))
    assert_equal(-1, a.chop_it(6, [1, 3, 5]))
  end
  
  def test_array_of_four
    
    a = BinarySearch.new
    
    assert_equal(0,  a.chop_it(1, [1, 3, 5, 7]))
    assert_equal(1,  a.chop_it(3, [1, 3, 5, 7]))
    assert_equal(2,  a.chop_it(5, [1, 3, 5, 7]))
    assert_equal(3,  a.chop_it(7, [1, 3, 5, 7]))
    assert_equal(-1, a.chop_it(0, [1, 3, 5, 7]))
    assert_equal(-1, a.chop_it(2, [1, 3, 5, 7]))
    assert_equal(-1, a.chop_it(4, [1, 3, 5, 7]))
    assert_equal(-1, a.chop_it(6, [1, 3, 5, 7]))
    assert_equal(-1, a.chop_it(8, [1, 3, 5, 7]))  
  end
  
  
  def test_empty_array_rec
    
      a = BinarySearch.new
      assert_equal(-1, a.recursive_search(3, []))
      
      #

      #

  end
  
  def test_array_of_one_rec
    a = BinarySearch.new
    
    assert_equal(-1, a.recursive_search(3, [1]))
    assert_equal(0,  a.recursive_search(1, [1]))
  end
  
  def test_array_of_three_rec
    a = BinarySearch.new
    
    assert_equal(0,  a.recursive_search(1, [1, 3, 5]))
    assert_equal(1,  a.recursive_search(3, [1, 3, 5]))
    assert_equal(2,  a.recursive_search(5, [1, 3, 5]))
    assert_equal(-1, a.recursive_search(0, [1, 3, 5]))
    assert_equal(-1, a.recursive_search(2, [1, 3, 5]))
    assert_equal(-1, a.recursive_search(4, [1, 3, 5]))
    assert_equal(-1, a.recursive_search(6, [1, 3, 5]))
  end
  
  def test_array_of_four_rec
    
    a = BinarySearch.new
    
    assert_equal(0,  a.recursive_search(1, [1, 3, 5, 7]))
    assert_equal(1,  a.recursive_search(3, [1, 3, 5, 7]))
    assert_equal(2,  a.recursive_search(5, [1, 3, 5, 7]))
    assert_equal(3,  a.recursive_search(7, [1, 3, 5, 7]))
    assert_equal(-1, a.recursive_search(0, [1, 3, 5, 7]))
    assert_equal(-1, a.recursive_search(2, [1, 3, 5, 7]))
    assert_equal(-1, a.recursive_search(4, [1, 3, 5, 7]))
    assert_equal(-1, a.recursive_search(6, [1, 3, 5, 7]))
    assert_equal(-1, a.recursive_search(8, [1, 3, 5, 7]))  
  end

end
