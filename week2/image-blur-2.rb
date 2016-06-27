class Image

  attr_accessor :image

  def initialize(array)
    if array[0].is_a?(Array)
      @image = array
    else
      begin
        raise 'You need to enter in a 2D array'
      rescue Exception => e
        puts e.message
      end
    end
  end

  def output_image
    @image.each do |x|
      x.each do |y|
        print y
      end
      puts
    end
    puts "--------"
  end

  def blur

    @image_blur = []

    @image.each_index do |row|
      @image[row].each_index do |column|

        # Ensure y or 'the column' is not out of bounds

        if @image[row][column] == 1
          if (column != 0) && (column != @image[row].length - 1)
            @image_blur << [row, column - 1]
            @image_blur << [row, column + 1]
          elsif (column == 0)
            @image_blur << [row, column + 1]
          elsif (column == @image[row].length - 1)
            @image_blur << [row, column - 1]
          end

        # Ensure x or 'the row' is not out of bounds
          if (row != 0) && (row != image.length - 1)
            @image_blur << [row - 1, column]
            @image_blur << [row + 1, column]
          elsif (row == 0)
            @image_blur << [row + 1, column]
          elsif (row == image.length - 1)
            @image_blur << [row - 1, column]
          end
        end

      end

    end

    # I can hard code 0 and 1, because each array element in image_blur
    # will only ever have 2 sub elements, the 'x'/'row' co-ordinate and the 'y' /'column' co-ordinate
    @image_blur.each do |coords|
      @image[coords[0]][coords[1]] = 1;
    end

  end


end

picaso = Image.new([
                     [1,0,0,1],
                     [0,0,0,0],
                     [1,0,0,1],
                     [0,0,0,0],
                     [0,0,0,0],
                     [1,0,0,1]
])

# picaso = Image.new('test')


picaso.output_image

picaso.blur
picaso.output_image

