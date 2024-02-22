def find_judge(n, trust)
  trust_counts = Array.new(n + 1, 0)
  trust.each do |a, b|
    trust_counts[a] -= 1
    trust_counts[b] += 1
  end

  (1..n).each do |i|
    return i if trust_counts[i] == n - 1
  end
 
  -1
end