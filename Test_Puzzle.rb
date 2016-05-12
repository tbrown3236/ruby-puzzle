require 'minitest/autorun'
require_relative 'puzzle.rb'

class TestPuzzle < Minitest::Test

  def test_set_puzzle
    assert_equal [[1, 4], [1, 5]], original_array.locate2d(59)
  end

  def test_display_as_matrix_with_valid_matrix
    assert original_array.to_s
  end

  def test_replace_existing_element
    @current_row = 1
    @current_col = 1
    Puzzle.new.send(:replace_existing_element, original_array, 00, @current_row, @current_col)
  end

  def test_set_current_row_col
    Puzzle.new.send(:set_current_row_col, original_array)
  end

  def test_move_up_method
    new_array = Puzzle.new.move_up(original_array)
    assert_equal new_array, after_move_up
  end

  def test_move_down_method
    new_array = Puzzle.new.move_down(original_array)
    assert_equal new_array, after_move_down
  end

  def test_move_right_method
    new_array = Puzzle.new.move_right(original_array)
    assert_equal new_array, after_move_right
  end

  def test_move_left_method
    new_array = Puzzle.new.move_left(original_array)
    assert_equal new_array, after_move_left
  end

  def after_move_left
    [
        [48, 37, 89, 13, 63, 24],
        [47, 53, 92, 90, 59, 59],
        [19, 30, 45, 85, 31, 65],
        [79, 16, 83, 65, "  ", 96]
    ]
  end

  def after_move_up
    [
        [48, 37, 89, 13, 63, 24],
        [47, 53, 92, 90, 59, 59],
        [19, 30, 45, 85, 31, "  "],
        [79, 16, 83, 65, 96, 65]
    ]
  end

  def after_move_down
    [
        [48, 37, 89, 13, 63, "  "],
        [47, 53, 92, 90, 59, 59],
        [19, 30, 45, 85, 31, 65],
        [79, 16, 83, 65, 96, 24]
    ]
  end

  def original_array
    [
        [48, 37, 89, 13, 63, 24],
        [47, 53, 92, 90, 59, 59],
        [19, 30, 45, 85, 31, 65],
        [79, 16, 83, 65, 96, "  "]
    ]
  end

  def after_move_right
    [
        [48, 37, 89, 13, 63, 24],
        [47, 53, 92, 90, 59, 59],
        [19, 30, 45, 85, 31, 65],
        ["  ", 16, 83, 65, 96, 79]
    ]
  end
end