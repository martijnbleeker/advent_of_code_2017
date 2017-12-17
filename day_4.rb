def passphrase_valid?(passphrase)
  tokens = passphrase.split(" ")
  tokens.length == tokens.uniq.length
end

def anagram_passphrase_valid?(passphrase)
  tokens = passphrase.split(" ").map { |token| token.chars.sort.join }
  tokens.length == tokens.uniq.length
end

def number_valid(input, method)
  input.split("\n").select { |line| send(method, line) }.length
end

puts "Number of valid passphrases: #{number_valid(ARGV[0], :passphrase_valid?)}"
puts "Number of valid passphrases (anagram policy): #{number_valid(ARGV[0], :anagram_passphrase_valid?)}"
