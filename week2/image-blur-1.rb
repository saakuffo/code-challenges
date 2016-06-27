class Image
  attr_accessor :image

  def initialize(array)
    if array[0].is_a?(Array)
      @image = array
    else
      @image = [array] # ref confident code - be more explicit
    end
  end

  def output_image
      @image.each do |x|
        x.each do |y|
          print y
        end
        puts ""
      end
  end

end

picaso = Image.new([
  [0,1,0,1],
  [1,1,0,1],
  [0,0,0,1],
  [1,1,1,1]
  ])
picaso.output_image
