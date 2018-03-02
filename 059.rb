
FILE_CONTENTS = File.read('data/059/p059_cipher.txt').strip.split(',').map(&:to_i)

# From: https://en.wikipedia.org/wiki/Most_common_words_in_English (yes I know I am quoting Wikipedia)
MOST_COMMON_WORDS_DOWNCASED_WITH_RANKING = [
  [1, 'the'], [2, 'be'], [3, 'to'], [4, 'of'], [5, 'and'], [6, 'a'], [7, 'in'],
  [8, 'that'], [9, 'have'], [1, 'I'], [11, 'it'], [12, 'for'], [13, 'not'], [14, 'on'],
  [15, 'with'], [16, 'he'], [17, 'as'], [18, 'you'], [19, 'do'], [20, 'at'], [21, 'this'],
  [22, 'but'], [23, 'his'], [24, 'by'], [25, 'from'], [26, 'they'], [27, 'we'], [28, 'say'],
  [29, 'her'], [30, 'she'], [31, 'or'], [32, 'an'], [33, 'will'], [34, 'my'], [35, 'one'],
  [36, 'all'], [37, 'would'], [38, 'there'], [39, 'their'], [40, 'what'], [41, 'so'], [42, 'up'],
  [43, 'out'], [44, 'if'], [45, 'about'], [46, 'who'], [47, 'get'], [48, 'which'], [49, 'go'],
  [50, 'me'], [51, 'when'], [52, 'make'], [53, 'can'], [54, 'like'], [55, 'time'], [56, 'no'],
  [57, 'just'], [58, 'him'], [59, 'know'], [60, 'take'], [61, 'people'], [62, 'into'], [63, 'year'],
  [64, 'your'], [65, 'good'], [66, 'some'], [67, 'could'], [68, 'them'], [69, 'see'], [70, 'other'],
  [71, 'than'], [72, 'then'], [73, 'now'], [74, 'look'], [75, 'only'], [76, 'come'], [77, 'its'],
  [78, 'over'], [79, 'think'], [80, 'also'], [81, 'back'], [82, 'after'], [83, 'use'], [84, 'two'],
  [85, 'how'], [86, 'our'], [87, 'work'], [88, 'first'], [89, 'well'], [90, 'way'], [91, 'even'],
  [92, 'new'], [93, 'want'], [94, 'because'], [95, 'any'], [96, 'these'], [97, 'give'], [98, 'day'],
  [99, 'most'], [100, 'us']
].map { |rank, word| [rank, word.downcase] }

best_likelihood = 0
solution = 0
password = nil
decrypted_string = nil
('a'..'z').to_a.permutation(3).each do |permutation|
  # FILE_CONTENTS.zip permutation.map(&:ord).cycle(FILE_CONTENTS.length)
  xor_decrypted_string = FILE_CONTENTS.zip(permutation.map(&:ord).cycle(FILE_CONTENTS.length)).map { |zipped_values| zipped_values.reduce(&:^) }.map(&:chr).join('')

  likelihood = 0
  xor_decrypted_string_downcased = xor_decrypted_string.downcase
  MOST_COMMON_WORDS_DOWNCASED_WITH_RANKING.each do |rank, downcased_word|
    if xor_decrypted_string_downcased.include? downcased_word
      likelihood = likelihood + 1
    end
  end

  if likelihood > best_likelihood
    best_likelihood = likelihood
    password = permutation.join('')
    decrypted_string = xor_decrypted_string
    solution = xor_decrypted_string.split('').map(&:ord).reduce(:+)
  end
end

puts "Solution: #{solution} (sum of ASCII values in decrypted string)"
puts "Password: #{password}"
puts "Decrypted message printed below:"
puts decrypted_string

=begin
C:\ProjectEulerSolutions>ruby 059.rb
Solution: 107359 (sum of ASCII values in decrypted string)
Password: god
Decrypted message printed below:
(The Gospel of John, chapter 1) 1 In the beginning the Word already existed. He was with God, and he was God. 2 He was in the beginning with God. 3 He created everything there is. Nothing exists that he didn't make. 4 Life itself was in him, and this life gives light to everyone. 5 The light shines through the darkness, and the darkness can never extinguish it. 6 God sent John the Baptist 7 to tell everyone about the light so that everyone might believe because of his testimony. 8 John himself was not the light; he was only a witness to the light. 9 The one who is the true light, who gives light to everyone, was going to come into the world. 10 But although the world was made through him, the world didn't recognize him when he came. 11 Even in his own land and among his own people, he was not accepted. 12 But to all who believed him and accepted him, he gave the right to become children of God. 13 They are reborn! This is not a physical birth resulting from human passion or plan, this rebirth comes from God.14 So the Word became human and lived here on earth among us. He was full of unfailing love and faithfulness. And we have seen his glory, the glory of the only Son of the Father.

C:\ProjectEulerSolutions>ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x64-mingw32]

=end


=begin
# Problem description (from projecteuler.net (https://projecteuler.net/problem=59); please visit the site and donate to it if you find it useful)
XOR decryption
Problem 59
Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.
=end

