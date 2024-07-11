require_relative "games"

class Database
  def initialize
    @games = []
  end

  def run
    loop do
      puts "\n"
      puts "Welcome to the Games Database!"
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
        puts "Thank you for visiting the Games Database. Goodbye!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  private

  def add_game
    print "Enter game title: "
    title = gets.chomp
    print "Enter platform name: "
    platform = gets.chomp
    @games << Games.new(title, platform)  # Corrected from @books to @games
    puts "Game added successfully!"
  end

  def list_games
    puts "Games in the collection:"
    @games.each do |game|
      puts game
    end
  end
end
