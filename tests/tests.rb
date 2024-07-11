require 'minitest/autorun'
require_relative '../database'
require_relative '../games'

class DatabaseTest < Minitest::Test
  def setup
    @database = Database.new
  end

  def test_add_game
    # Simulate user input
    simulated_user_input = StringIO.new("Test Game\nTest Platform\n")
    $stdin = simulated_user_input

    # Call add_game method
    @database.send(:add_game)

    # Restore $stdin
    $stdin = STDIN

    # Verify that the game was added
    assert_equal 1, @database.instance_variable_get(:@games).size
    game = @database.instance_variable_get(:@games).first
    assert_equal "Test Game", game.title
    assert_equal "Test Platform", game.platform
  end

  def test_list_games
    # Add a game to the database
    game = Games.new("Test Game", "Test Platform")
    @database.instance_variable_get(:@games) << game

    # Capture the output of the list_games method
    output = capture_io { @database.send(:list_games) }.first

    # Verify the output
    assert_match /Test Game for Test Platform/, output
  end

  private

  # Helper method to capture output
  def capture_io
    out, err = StringIO.new, StringIO.new
    $stdout, $stderr = out, err
    yield
    [out.string, err.string]
  ensure
    $stdout, $stderr = STDOUT, STDERR
  end
end
