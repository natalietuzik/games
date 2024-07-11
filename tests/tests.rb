require 'minitest/autorun'
require   './app'

class MyTest < Minitest::Test
  def test_user_input
    # Simulate user input by replacing $stdin with StringIO
    simulated_user_input = StringIO.new
    $stdin = simulated_user_input

    # Call the method that we are testing
    output = Database.run

    # Restore $stdin so other tests are not affected by replacement
    $stdin = STDIN

    # Assert the expected outcome of the test
    assert_equal "expected output", output
  end
end
