class BinarySearch

  def chop_it(int, array_of_int) # incremental self-contained binary serach
    position = 0
    if array_of_int.empty?
      return - 1
    end
    
    tail = array_of_int.size - 1
    mid = 0
    count = 0
    
    while true
      mid = position + ( (tail-position) / 2 )
      
      if array_of_int[mid] == int
        return mid
      elsif position == tail || tail < position
        return - 1
      end
      
      if  int > array_of_int[mid]
        position = mid + 1
      elsif int < array_of_int[mid]
        tail = mid - 1
      end
      
      #puts mid   
    end    
  end
  
  
  def recursive_search(int, array_of_int)
    return get_chop(0, array_of_int.size - 1, array_of_int, int)
  end
  
  def get_chop(pos, tail, array_of_int, int)
    mid = pos + ( (tail-pos) / 2 )
    
     if array_of_int[mid] == int
        return mid
      elsif pos == tail || tail < pos
        return - 1
      end
      
      if  int > array_of_int[mid]
        pos = mid + 1
      elsif int < array_of_int[mid]
        tail = mid - 1
      end
      
      return get_chop(pos, tail, array_of_int, int)
    
  end
  
end
