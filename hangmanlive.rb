class Hangman

  def initialize
    @head        = " "
    @l_arm       = " "
    @r_arm       = " "
    @body        = " "
    @l_leg       = " "
    @r_leg       = " "
    @secret      = random_word
    @characters  = empty_characters
    @guesses     = []
    @wrongguesses = []
  end

#creates a new array of empty characters based on the length of the chosen word
  def empty_characters
    Array.new(@secret.length, "-")
    # a = []
    # @secret.length.times {a << "_"}
  end

  def game_win
    words.each do |answer|
      if guess == answer
        puts "You win. The answer is: #{answer}!"
      elsif @wrongguesses.length >= 6
        puts "Sorry, you lost"
        return true
      end
    end
    return false
  end

  # def game_lose
  #   if @wrongguesses.length >= 7
  #     puts "Sorry, you lost"
  #   end
  # end

  # def guessed(guessed_letter)
  #   @guesses << guessed_letter
  # end


  def addguess(input)
    @guesses << input
  end

  def oneguess(input)
    if @guesses.include?(input)
      puts "You already guessed that"
    end
  end



#checks secret word to see if the letters match, then uses the index of the secret array and puts the letters on the characters array
  def make_guess(guessed_letter)
    #this will exit the method and not do the stuff below it
    # return false if @guesses.include?(guessed_letter)
    @secret.chars.each_with_index do |letter, index|
      if guessed_letter == letter
        @characters[index] = letter
      end
    end
    if !@secret.chars.include?(guessed_letter)
      @wrongguesses << guessed_letter
    end
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

  def addbody
    if @wrongguesses.length == 1
      @head = "()"
    elsif @wrongguesses.length == 2
      @head = "()"
      @l_arm = "\\"
    elsif @wrongguesses.length == 3
      @head = "()"
      @l_arm = "\\"
      @body = "|"
    elsif @wrongguesses.length == 4
      @head = "()"
      @l_arm = "\\"
      @body = "|"
      @r_arm = "/"
    elsif @wrongguesses.length == 5
      @head = "()"
      @l_arm = "\\"
      @body = "|"
      @r_arm = "/"
      @l_leg = "/"
    elsif @wrongguesses.length == 6
      @head = "()"
      @l_arm = "\\"
      @body = "|"
      @r_arm = "/"
      @l_leg = "/"
      @r_leg = "\\"
    end
  end


  def board
    <<-BOARD
***************************************************
_____|
|/   |
|   #{@head}
|   #{@l_arm}#{@body}#{@r_arm}
|   #{@l_leg} #{@r_leg}
|
________
     BOARD
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
    while h.game_win == false
      h.addbody
      puts h.board
      puts h.guess
      puts "What letter do you want to guess?\n"
      guess = gets.chomp.downcase
      h.oneguess(guess)
      h.make_guess(guess)
      h.addguess(guess)

    end
end

run
