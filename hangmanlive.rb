class Hangman

  def initialize
    @head = " "
    @l_arm = " "
    @r_arm = " "
    @body = " "
    @l_leg = " "
    @r_leg = " "
    @secret = random_word
  end

  def random_word
    words.sample
  end

  def words
    ["blah", "foo", "bar"]
  end

  def board
    "_____|    \n|/   |\n|   #{@head} \n|   #{@l_arm}#{@body}#{@r_arm} \n|    #{@l_leg} #{@r_leg} \n|    \n--------"
  end


end


#Draw and print the board
# secret word
# take a guess and compare it to the secret word
# remember guesses
# remember which parts have been added
# it should know when the game is won or lost
# it should know if a guess is already been guessed
# body parts need color



h = Hangman.new
puts h.board
puts h.inspect


















#
#
#
# #.sample picks out a random item from an array and prints it out
#
# # class Game
# #
# #   def initalize
# #     puts ["|     _________",
# #       "|     |/      |", "|     |      ","|     |      ", "|     |       ", "|     |      ", "|     |", "| ____|___"]
# #   end
#
#   class Hangman
#     attr_accessor :blank, :word, :exposedword
#
#     def initialize(wordbank)
#       @blank = "_"
#       @word = wordbank.sample.chars.to_a
#       @exposedword = blanks.chars.to_a
#     end
#
#
#     def test
#       puts @word.to_s
#     end
#
#     def charactercount
#       @word.length
#     end
#
#     def blanks
#       @blank * charactercount
#     end
#
#
#     def guess(input)
#       @word.each_with_index do |c, i|
#         if input == c
#           @exposedword[i] = c
#           puts @exposedword.to_s
#         else
#           puts "Guess again"
#         end
#       end
#     end
#
#
#
#     # def guessing(input)
#     #   @word.each do |letter|
#     #     if input == letter
#     #       puts input
#     #     else
#     #       puts "_"
#     #     end
#     #   end
#     # end
#   end
# #end
#
# wordbank = ["Russian", "English", "Spanish", "French", "Japanese"]
#
#
# mygame = Hangman.new(wordbank)
#
# mygame.test
# puts "Guess a letter"
# input = gets.chomp
# mygame.guess(input)
# input2 = gets.chomp
#
#
#
# #puts mygame.blanks[4]
#
#
#
#
#
#
#
#
#
#
#
# #
