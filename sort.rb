module Sort

  def self.selection_sort(array)
  	arr = array.clone
  	n = arr.size
	  if arr.size <= 1
	    return arr
	  end
	  n.times do |index|
      min_index = index

	    (index+1).upto(n-1) do |i|
	    	if arr[i] < arr[min_index]
	    		min_index = i
	    	end
	    end
	    arr[index], arr[min_index] = arr[min_index], arr[index]
	  end
	  return arr
  end

end