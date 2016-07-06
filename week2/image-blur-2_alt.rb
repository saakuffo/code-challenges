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
            
          if row != 0
            @image_blur << [row-1, column]
          end
            
          if column != 0
            @image_blur << [row, column-1]
          end

          if row != @image.length - 1
            @image_blur << [row+1, column]
          end
          if column != @image[0].length - 1
            @image_blur << [row, column+1]
          end   
            
        end

      end

    end

    # I can hard code 0 and 1, because each array element in image_blur
    # will only ever have 2 sub elements, the 'x'/'row' co-ordinate and the 'y' /'column' co-ordinate
    @image_blur.each do |pixel|
      @image[pixel[0]][pixel[1]] = 1;
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

