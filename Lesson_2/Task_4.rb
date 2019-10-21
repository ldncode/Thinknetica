hash = {}

('a'..'z').each.with_index(1) do |letter, index|
  hash[letter] = index if 'aeiou'.include?(letter)
end

p hash
