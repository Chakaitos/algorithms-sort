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

  # return the array if it's size 1 or less
  # sort the left half
  # sort the right half
  # merge the two halves and return

	def self.mergesort(array)
	  return array if array.length <= 1

    mid_point = array.size / 2
    left = array[0...mid_point]
    right = array[mid_point...array.size]

    left = mergesort(left)
    right = mergesort(right)

    merge(left, right)
	end

  def self.merge (left, right)
    result = []
    if left == []
      return right
    elsif right == []
      return left
    else
      while left.length > 0 || right.length > 0
        if left.length > 0 && right.length > 0
          if left[0] <= right[0]
          result.push(left.slice!(0))
          else 
          result.push(right.slice!(0))
          end
        elsif left.length > 0
          result.concat(left.slice!(0, left.length))
        elsif right.length > 0
          result.concat(right.slice!(0, right.length))
        end
      end
    end
    result
  end
end