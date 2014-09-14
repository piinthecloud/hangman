require "colorize"

class Hangman

  def initialize
    @head         = " "
    @l_arm        = " "
    @r_arm        = " "
    @body         = " "
    @l_leg        = " "
    @r_leg        = " "
    @secret       = random_word
    @characters   = empty_characters
    @guesses      = []
    @wrongguesses = []
  end

  #creates a new array of empty characters based on the length of the chosen word
  def empty_characters
    Array.new(@secret.length, "-")
  end

  #while this method evaluates to false, the while loop in .run will keep running.
  def game_win
    words.each do |answer|
      if guess == answer
        puts "You win.".light_green.blink
        puts "The answer is: #{answer}!"
        return true
      elsif @wrongguesses.length >= 6
        puts "Sorry, you lost. The answer was #{answer}"
        return true
      end
    end
    return false
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
    if not_in_secret?(guessed_letter) && not_in_wrong?(guessed_letter)
       @wrongguesses << (guessed_letter)
    end
  end

  def not_in_secret?(letter)
    !@secret.chars.include?(letter)
  end

  def not_in_wrong?(letter)
    !@wrongguesses.include?(letter)
  end

  def addguess(input)
    @guesses << input
  end

  def oneguess(input)
    if @guesses.include?(input)
      puts "You already guessed that"
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

  def display_wrongguesses
    puts "You've already guessed these letters: #{@wrongguesses.join}"
  end

  def words
    ["justice", "latina", "feminism", "culture", "knowledge", "mujerista"]
  end

  def addbody
    if @wrongguesses.length == 1
      @head = "()".colorize(:light_blue)
    elsif @wrongguesses.length == 2
      @head = "()".colorize(:light_blue)
      @l_arm = "\\".colorize(:red)
    elsif @wrongguesses.length == 3
      @head = "()".colorize(:light_blue)
      @l_arm = "\\".colorize(:red)
      @body = "|".colorize(:white)
    elsif @wrongguesses.length == 4
      @head = "()".colorize(:light_blue)
      @l_arm = "\\".colorize(:red)
      @body = "|".colorize(:white)
      @r_arm = "/".colorize(:red)
    elsif @wrongguesses.length == 5
      @head = "()".colorize(:light_blue)
      @l_arm = "\\".colorize(:red)
      @body = "|".colorize(:white)
      @r_arm = "/".colorize(:red)
      @l_leg = "/".colorize(:light_blue)
    elsif @wrongguesses.length == 6
      @head = "()".colorize(:light_blue)
      @l_arm = "\\".colorize(:red)
      @body = "|".colorize(:white)
      @r_arm = "/".colorize(:red)
      @l_leg = "/".colorize(:light_blue)
      @r_leg = "\\".colorize(:_light_blue)
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

def run
  h = Hangman.new
    while h.game_win == false
      h.addbody
      puts h.board
      puts h.guess
      puts "What letter do you want to guess?\n"
      guess = gets.chomp.downcase
      h.display_wrongguesses
      h.oneguess(guess)
      h.make_guess(guess)
    end
end
run
