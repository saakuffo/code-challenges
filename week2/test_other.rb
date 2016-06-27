class Image
  attr_accessor :image_data

  def initialize(data)
    @image_data = data
  end

  def blur(row_index,col_index)
      if row_index != 0
        @image_data[row_index-1][col_index] = 1
      end
      if col_index != 0
        @image_data[row_index][col_index-1] = 1
      end
      
      if col_index != image_data[row_index].length - 1
        @image_data[row_index][col_index+1] = 1
      end
      if row_index != image_data.length - 1
        @image_data[row_index+1][col_index] = 1
      end
  end

  def transform
    ones = []
    @image_data.each_with_index do |row, row_index|
      row.each_with_index do |pixel, col_index|
        if pixel == 1
          ones.push [row_index, col_index]
        end
      end
    end
    ones.each do |pair|
      row_index, col_index = pair
      blur(row_index, col_index)
    end
  end

  def output_image
    @image_data.each do |row|
      row.each do |pixel|
        print pixel
      end
      puts
    end
    puts "------------"
  end

end

i = Image.new([
                [1, 0, 0, 1],
                [0, 0, 0, 0],
                [1, 0, 0, 1],
                [0, 0, 0, 0],
                [0, 0, 0, 0],
                [1, 0, 0, 1]
])

i.output_image
i.transform
i.output_image

#TESTS BELOW

