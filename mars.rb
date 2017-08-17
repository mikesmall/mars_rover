class Rover

  attr_accessor :x_coordinate, :y_coordinate, :direction, :text_filename, :instructions

  def initialize
    @lower_left_corner  = [0, 0]
    @upper_right_corner = []
    @x_coordinate       = 0
    @y_coordinate       = 0
    @direction          = ""
    @instructions       = []
  end

  def direction_to_string
    @direction_to_string = ""
      if @direction == "N"
        @direction_to_string = "North"
      elsif @direction == "E"
        @direction_to_string = "East"
      elsif @direction == "W"
        @direction_to_string = "West"
      elsif @direction == "S"
        @direction_to_string = "South"
      end
  end

  def get_file
    # For now, accept string entered by user:
    puts "Type or paste your entire input: "
    @instructions = gets.chomp
    # Future file-acceptance code:
    # puts "Type the name of your input file (e.g. input.txt): "
    # @text_filename = gets.chomp.to_s
    # File.open(@text_filename).each do |line|
    #  @input = line.split("")
    read_instruction
  end

  def read_instruction
    # Split file contents into array
    @instructions = @instructions.split

    # First two characters establish upper right corner
    # (Lower left is assumed to be 0, 0)
    puts "Upper-right corner of Plateau detected: X-coordinate #{@instructions[0]} and Y-coordinate #{@instructions[1]}."
    puts "Lower-left corner of Plateau is X-coordinate #{@lower_left_corner[0]} and Y-coordinate #{@lower_left_corner[1]}."

    # Initial Rover placement:
    @x_coordinate = @instructions[2].to_i
    @y_coordinate = @instructions[3].to_i
    @direction = @instructions[4]
    direction_to_string
    puts "A Mars Rover landed on the Plateau at X-coordinate #{@x_coordinate} and Y-coordinate #{@y_coordinate}, facing #{@direction_to_string}."
    # Rover movement:
    @movements = @instructions[5].split("")
    @movements.each do |character|
      if character == "L"
        turn_left
      elsif character == "R"
        turn_right
      elsif character == "M"
        move
      end
    end
    give_result
  end

  def turn_left
    if @direction == "N"
      @direction = "W"
    elsif @direction == "W"
      @direction = "S"
    elsif @direction == "S"
      @direction = "E"
    elsif @direction == "E"
      @direction = "N"
    end
    puts "The Rover turned left."
  end

  def turn_right
    if @direction == "N"
      @direction = "E"
    elsif @direction == "E"
      @direction = "S"
    elsif @direction == "S"
      @direction = "W"
    elsif @direction == "W"
      @direction = "N"
    end
    puts "The Rover turned right."
  end

  def move
    if direction == "N"
      @y_coordinate += 1
    elsif direction == "E"
      @x_coordinate += 1
    elsif direction == "S"
      @y_coordinate -= 1
    elsif direction == "W"
      @x_coordinate -= 1
    end
    puts "The Rover moved forward."
  end

  def give_result
    direction_to_string
    puts "The Rover has arrived at X-coordinate #{@x_coordinate} and Y-coordinate #{@y_coordinate}, facing #{@direction_to_string}."
  end

end

rover1 = Rover.new
rover1.get_file
