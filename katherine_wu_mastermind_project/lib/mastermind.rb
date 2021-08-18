require_relative "code"
require "byebug"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_guess)
        puts "exact matches: " + @secret_code.num_exact_matches(code_guess).to_s
        puts "near matches: " + @secret_code.num_near_matches(code_guess).to_s
    end

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        guess = Code.from_string(input)
        print_matches(guess)
        @secret_code.num_exact_matches(guess) == @secret_code.length
    end

end
