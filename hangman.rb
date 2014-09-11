#.sample picks out a random item from an array and prints it out

# class Game
#
#   def initalize
#     puts ["|     _________",
#       "|     |/      |", "|     |      ","|     |      ", "|     |       ", "|     |      ", "|     |", "| ____|___"]
#   end

  class Hangman
    attr_accessor :blank, :word, :exposedword

    def initialize(wordbank)
      @blank = "_"
      @word = wordbank.sample.chars.to_a
      @exposedword = blanks.chars.to_a
    end


    def test
      puts @word.to_s
    end

    def charactercount
      @word.length
    end

    def blanks
      @blank * charactercount
    end


    def guess(input)
      @word.each_with_index do |c, i|
        if input == c
          @exposedword[i] = c
          puts @exposedword.to_s
        else
          puts "Guess again"
        end
      end
    end



    # def guessing(input)
    #   @word.each do |letter|
    #     if input == letter
    #       puts input
    #     else
    #       puts "_"
    #     end
    #   end
    # end
  end
#end

wordbank = ["Russian", "English", "Spanish", "French", "Japanese"]


mygame = Hangman.new(wordbank)

mygame.test
puts "Guess a letter"
input = gets.chomp
mygame.guess(input)
input2 = gets.chomp



#puts mygame.blanks[4]











#