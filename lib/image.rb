class Image

  def initialize(data)
    @data = data
  end
    
  def output_image
      @data.each do |blur|
      puts blur.join
      end
  end

    def blur
      transform = []
        @data.each_with_index do |element, y|
          element.each_with_index do |number, x|
          transform << [y, x] if number == 1
          end
        end
    transform.each do |y, x|
      @data[y-1][x]=1 if valuecoords(y-1,x) == 0
      @data[y][x-1]=1 if valuecoords(y,x-1) == 0
      @data[y+1][x]=1 if valuecoords(y+1,x) == 0
      @data[y][x+1]=1 if valuecoords(y,x+1) == 0
      end                                         
    end

    def valuecoords(y, x)  
      row = @data[y]
      return nil if row.nil?
      row[x]
    end
end    
  
  image = Image.new([
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
  ])
  image.blur
  image.output_image