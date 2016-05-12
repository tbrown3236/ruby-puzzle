class Array
  # This method will return location of supplied element
  def locate2d (array)
    r = []
    each_index do |i|
      row, j0 = self[i], 0
      while row.include? (array)
        if j = (row.index (array))
          r << [i, j0 + j]
          j  += 1
          j0 += j
          row = row.drop j
        end
      end
    end
    r
  end

  # This method will display array in form of matrix
  def to_s
    self.each do |r|
      puts r.each { |p| p }.join(" ")
    end
  end
end

class Puzzle
  def run_puzzle
    get_puzzle
    set_puzzle(@rows, @cols)
  end

  def set_puzzle(rows, cols)
    m = Array.new(rows){Array.new(cols){rand(1..9)} }
    m[rows-1][cols-1] = '  '
    m.to_s
    process_user_response(m)
  end

  def get_puzzle
    # puts "Enter Height"
    row = 3
    # puts 'Enter Width'
    col = 3
    @rows = row.to_i
    @cols = col.to_i
  end
  # def get_puzzle
  #   puts "Enter Height"
  #   row = gets.chomp
  #   puts 'Enter Width'
  #   col = gets.chomp
  #   @rows = row.to_i
  #   @cols = col.to_i
  # end


  # This method will process the value entered by user
  def process_user_response(arr)
    while (key = gets.chomp) != 'exit'
      puts "Please write u, l, r, d or 'exit' to quite"
      case key
        when 'u' then move_up(arr)
        when 'l' then move_left(arr)
        when 'r' then move_right(arr)
        when 'd' then move_down(arr)
        when 'exit' then break
      end
      arr.to_s
    end
  end

  # This method will move the space to up
  def move_up(array)
    set_current_row_col(array)
    new_row = (@current_row == 0) ? array.length - 1 : @current_row - 1  # This logic will decide the new co-ordinated of space
    current_ele = array[new_row][@current_col]
    prepare_new_array(new_row, @current_col, array, current_ele, @current_row)
  end

  # This method will move the space to down
  def move_down(array)
    set_current_row_col(array)
    new_row = @current_row == array.length - 1 ? 0 : @current_row + 1  # This logic will decide the new co-ordinated of space
    current_ele = array[new_row][@current_col]
    array[new_row][@current_col] = '  '
    replace_existing_element(array,current_ele, @current_row, @current_col)
    array
  end

  # This method will move the space to right
  def move_right(array)
    set_current_row_col(array)
    new_col = (@current_col == array.first.length - 1) ? 0 : @current_col + 1  # This logic will decide the new co-ordinated of space
    current_ele = array[@current_row][new_col]
    array[@current_row][new_col] = '  '
    replace_existing_element(array,current_ele, @current_row, @current_col)
    array
  end

  # This method will move space to left
  def move_left(array)
    set_current_row_col(array)
    new_col = (@current_col == 0) ?  array.first.length - 1 : @current_col - 1 # This logic will decide the new co-ordinated of space
    current_ele = array[@current_row][new_col]
    array[@current_row][new_col] = '  '
    replace_existing_element(array,current_ele, @current_row, @current_col)
    array
  end

  def prepare_new_array(new_row, current_col, array, current_ele, current_row)
    array[new_row][@current_col] = '  '
    replace_existing_element(array,current_ele, @current_row, @current_col)
    array
  end
  # This method will return current row and column of space
  def set_current_row_col(array)
    current_s_index = array.locate2d('  ')
    @current_row = current_s_index.flatten.first
    @current_col = current_s_index.flatten.last
  end

  # This method will set the new element at the place of space which is replaced by it 
  def replace_existing_element(matrix,element, current_row, current_col)
    matrix[current_row][current_col] = element
  end
end

# Initialize class
Puzzle.new.run_puzzle

