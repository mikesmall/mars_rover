class Rover

  attr_accessor :x_coordinate, :y_coordinate, :direction, :instructions, :the_file

  def initialize
    @lower_left_corner  = [0, 0]
    @upper_right_corner = []
    @x_coordinate       = 0
    @y_coordinate       = 0
    @direction          = ""
    @the_file           = ""
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
    puts "Enter filename: "
    @the_file = gets.chomp
    @instructions = File.readlines("#{@the_file}").map
    # Remove "\n" from array elements:
    @instructions.each do |instruction|
      instruction.chop!
    end
    @instructions = @instructions.to_a
    read_instruction
  end

  def read_instruction
    # Create array from input:
    @upper_right_corner = @instructions[0].split
    puts "Lower-left corner of Plateau is X-coordinate #{@lower_left_corner[0]} and Y-coordinate #{@lower_left_corner[1]}."
    puts "Upper-right corner of Plateau detected: X-coordinate #{@upper_right_corner[0]} and Y-coordinate #{@upper_right_corner[1]}."

    # Initial Rover placement:
    @initial_placement = @instructions[1].split
    @x_coordinate = @initial_placement[0].to_i
    @y_coordinate = @initial_placement[1].to_i
    @direction    = @initial_placement[2]
    direction_to_string
    puts "A Mars Rover landed at X-coordinate #{@x_coordinate} and Y-coordinate #{@y_coordinate}, facing #{@direction_to_string}."

    # Rover movement:
    @movements = @instructions[2].split("")
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
    puts "It turned left."
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
    puts "It turned right."
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
    puts "It moved forward."
  end

  def give_result
    direction_to_string
    puts "The Mars Rover has arrived at X-coordinate #{@x_coordinate} and Y-coordinate #{@y_coordinate}, facing #{@direction_to_string}."
  end

end

rover1 = Rover.new
rover1.get_file
