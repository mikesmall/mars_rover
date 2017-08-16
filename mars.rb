class Rover

  attr_accessor :x_position, :y_position, :direction, :text_filename

  def initialize # Default rover position: Bottom left, facing north
    @x_coordinate  = 0
    @y_coordinate  = 0
    @direction     = 'N'
    @text_filename = 'text_filename'
  end

  def get_file(filename)
    # Accept file
    puts 'Type the name of your input file (e.g. input.txt): '
    @text_filename = gets.chomp
  end

  def read_instruction(instruction)
    # Split file contents into array
    # 'If' statements for useable characters:
    # -- 0..9 (x/y coordinates)
    # ----- convert 0..9 to integers
    # -- N, E, W, S (north, south, east, west)
    # -- L, R, M (left, right, move)

  end

  def turn # Affects direction of rover

  end

  def move # Affects position of rover

  end

  def give_result # Print new position of rover
    puts 'The Mars Rover is now at X-coordinate #{@x_coordinate}, Y-coordinate #{@y_coordinate}, facing #{@direction}.'
  end

end

get_file
read_instruction
turn
move
give_result
