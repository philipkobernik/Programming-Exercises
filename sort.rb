class Sort
  
  def selection_sort(a)
    
    a.each_with_index {|elem, i|        
      low = [elem,0]
      
      a[i,a.size-i].each_with_index {|cand,x| #slice the array, get the remaining unsorted portion
        if cand < low[0] 
          low = [cand,x] # set new value to low if it is < low
        end        
      }        
      
      a.delete_at(low[1] + i) # delete lowest remaining array item ('+ i' to adjust for inner loop offset)
      a.insert(i, low[0]) # insert same item in the 'next' position in the outer loop iteration
    }      
    return a
  end
end

#puts a.join(", ").to_s


