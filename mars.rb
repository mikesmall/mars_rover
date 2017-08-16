class Rover

  attr_accessor :x_coordinate, :y_coordinate, :direction, :text_filename, :upper_right_corner

  def initialize # Default rover position: Bottom left, facing north
    @lower_left_corner  = [0, 0]
    @upper_right_corner = []
    @x_coordinate       = 0
    @y_coordinate       = 0
    @direction          = 'N'
    @text_filename      = 'text_filename'
  end

  def get_file
    # For now, accept string entered by user:
    puts 'Type or paste your entire input: '
    @text_filename = gets.chomp.to_s
    # Future file-acceptance code:
    # puts 'Type the name of your input file (e.g. input.txt): '
    # @text_filename = gets.chomp.to_s
    # File.open(@text_filename).each do |line|
    #  @input = line.split('')
    end
  end

  def read_instruction(instruction)

    # Split file contents into array
    @input = @text_filename.split

    # Convert first two characters to integers -- they will establish upper right corner (5, 5)
    # (the lower left is assumed to be 0, 0)
    # Store in a variable for the upper right corner
    @upper_right_corner = @text_filename(0,1)

    # Iterate over the array:
    

    # Convert second two characters to integers -- they will establish rover's starting position

    end

  end

  def turn_left
    if @direction == 'N'
      @direction = 'W'
    elsif @direction == 'W'
      @direction = 'S'
    elsif @direction == 'S'
      @direction = 'E'
    elsif @direction == 'E'
      @direction = 'N'
    end
  end

  def turn_right
    if @direction == 'N'
      @direction = 'E'
    elsif @direction == 'E'
      @direction = 'S'
    elsif @direction == 'S'
      @direction = 'W'
    elsif @direction == 'W'
      @direction = 'N'
    end
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
read_instruction(@text_filename)
give_result
