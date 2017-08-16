class Rover

  attr_accessor :x_position, :y_position, :direction, :text_filename

  def initialize # Default rover position: Bottom left, facing north
    @x_coordinate  = 0
    @y_coordinate  = 0
    @direction     = 'N'
    @text_filename = 'text_filename'
  end

  def get_file(filename)
    puts 'Type the name of your input file (e.g. input.txt): '
    @text_filename = gets.chomp.to_s

    File.open(@text_filename).each do |line|

      @input = line.split('')

      @input.each do |character|
        if character == ''
      end

    end
  end

  def read_instruction(instruction)
    # Split file contents into array
    # 'If' statements for useable characters:
    # -- 0..9 (x/y coordinates)
    # ----- convert 0..9 to integers
    # -- N, E, W, S (north, south, east, west)
    # -- L, R, M (left, right, move)

  end

  def turn(right_or_left)

  end

  def move(number_of_steps)

  end

  def give_result
    @direction_to_string = ''
    if @direction == 'N'
      @direction_to_string = 'North'
    elsif @direction == 'E'
      @direction_to_string = 'East'
    elsif @direction == 'W'
      @direction_to_string = 'West'
    elsif @direction == 'S'
      @direction_to_string = 'South'
    end
    puts 'The Mars Rover is now at X-coordinate #{@x_coordinate} and Y-coordinate #{@y_coordinate}, facing #{@direction}.'
  end

end

get_file
read_instruction
turn
move
give_result
