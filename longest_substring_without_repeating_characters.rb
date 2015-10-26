# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 if s == ''
  max_length, current_length, from = 1, 0, 0
  h = {}
  s.size.times do |i|
    if h[s[i]].nil? || h[s[i]] < from
      h[s[i]] = i
      current_length += 1
    else
      from = h[s[i]] + 1
      max_length = current_length if current_length > max_length
      current_length = i - h[s[i]]
      h[s[i]] = i
    end
  end
  current_length > max_length ? current_length : max_length
end