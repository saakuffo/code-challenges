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
    @image.each do |row|
      row.each do |column|
        print column
      end
      puts
    end
    puts "--------"
  end

  def blur

    @image_to_blur = get_blur_coords(@image)

    @image_to_blur.each do |x|
      row = x[0]
      column = x[1]

      if row != 0
        @image[row-1][column] = 1
      end
      if column != 0
        @image[row][column-1] = 1
      end

      if row != image.length - 1
        @image[row+1][column] = 1
      end
      if column != image[0].length - 1
        @image[row][column+1] = 1
      end

    end
  end



  def get_blur_coords(array)
    coordinates = []
    array.each_index do |row|
      array[row].each_index do |column|
        if array[row][column] == 1
          coordinates << [row, column]
        end
      end
    end

    return coordinates
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
