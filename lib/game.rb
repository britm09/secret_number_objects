require 'lib/person'
require 'lib/secret_number'

class Game
# this class will be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly
def initialize
	@new_random_number = SecretNumber.make_it
	@guess_count = 2
end

def start
	puts "What's your guess?"
	@guess = get_input.to_i
	if @guess == 0
		puts "Whoops, that's invalid.  Try again."
		start
	elsif @guess == @new_random_number
		puts "Woohoo!  Winner!"
	else @guess != @new_random_number
		next_round
	end
@guess_count -= 1
end

def next_round
	if @guess_count == 0
		puts "You lost.  Bye!"
	elsif @guess_count >1 && @guess > @new_random_number 
		puts "Too high. You still have #{@guess_count} tries left."
		@guess_count -= 1
		start
	elsif @guess_count >1 && @guess < @new_random_number
		puts "Too low. You still have #{@guess_count} tries left."
		@guess_count -= 1
		start
	elsif @guess_count == 1 && @guess > @new_random_number 
		puts "Too high. You have just #{@guess_count} try left."
		@guess_count -= 1
		start
	else @guess_count == 1 && @guess < @new_random_number
		puts "Too low. You have just #{@guess_count} try left."
		@guess_count -= 1
		start
	end
end

end


