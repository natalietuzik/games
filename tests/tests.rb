require 'minitest/autorun'
require './app'

class tests < Minitest::tests
  def tests_run
    assert_output("Welcome to your Games Database!\n") { run }
  end
end

def run
  loop do
    puts "\n"
    puts "Welcome to your Games Database!"
    puts "1. Add a game"
    puts "2. List all games"
    puts "3. Exit"
    print "Choose an option: "
    option = gets.chomp.to_i
    puts "\n"
    case option
    when 1
      add_game
    when 2
      list_games
    when 3
      puts "Thank you for visiting your Games Database. Goodbye!"
      break
    else
      puts "Invalid option. Please try again."
    end
  end
end
