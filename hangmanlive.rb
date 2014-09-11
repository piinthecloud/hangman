class Hangman

  def initialize
    @head       = " "
    @l_arm      = " "
    @r_arm      = " "
    @body       = " "
    @l_leg      = " "
    @r_leg      = " "
    @secret     = random_word
    @characters = empty_characters
    @guesses    = []
  end

#creates a new array of empty characters based on the length of the chosen word
  def empty_characters
    Array.new(@secret.length, "-")
    # a = []
    # @secret.length.times {a << "_"}
  end

  def game_over
    words.each do |answer|
      if guess == answer
        puts "ou win. The answer is: #{answer}!"
        return true
      end
    end
    return false
  end

  def guessed(guessed_letter)
    @guesses << guessed_letter
  end


#checks secret word to see if the letters match, then uses the index of the secret array and puts the letters on the characters array
  def make_guess(guessed_letter)
    #this will exit the method and not do the stuff below it
    return false if @guesses.include?(guessed_letter)
    @secret.chars.each_with_index do |letter, index|
      if guessed_letter == letter
        @characters[index] = letter
      end
    end
    @guesses << guessed_letter
  end

#prints the contents of the array
  def guess
    @characters.join
  end

  def characters
    @characters
  end

  def random_word
    words.sample
  end

  def words
    ["blarrg", "fooa", "barss"]
  end

  def board
    "_____|    \n|/   |\n|   #{@head} \n|   #{@l_arm}#{@body}#{@r_arm} \n|    #{@l_leg} #{@r_leg} \n|    \n________"
  end

end


#Draw and print the board
# secret word
# ***take a guess and compare it to the secret word, update the characters with the guessed letter
# make concept of blank spaces
# remember guesses
# remember which parts have been added
# it should know when the game is won or lost
# it should know if a guess is already been guessed
# body parts need color

def run
  h = Hangman.new
    while h.game_over == false
      puts h.board
      puts h.guess
      puts "What letter do you want to guess?\n"
      guess = gets.chomp
      h.make_guess(guess)
    end
end

run
