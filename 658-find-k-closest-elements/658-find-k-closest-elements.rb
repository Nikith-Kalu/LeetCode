def find_closest_elements(arr, k, x)
  arr[(0..arr.size).bsearch { |i| x - arr[i] <= (arr[i+k] || 1/0.0) - x }, k]
end