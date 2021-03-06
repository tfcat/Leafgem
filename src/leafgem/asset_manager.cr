class Leafgem::AssetManager
  @@sprites = {} of String => SDL::Surface

  def self.image(filename : String)
    # This empty string can be replaced with a special Leafgem
    # "no image" image file. Like, black + pink checkerboard lmao
    filename ||= ""

    if texture = @@sprites[filename]?
      texture
    else
      @@sprites[filename] = SDL::IMG.load(filename || "")
    end
  end
end

class Leafgem::Spritesheet
  @sprite : SDL::Surface
  @quads = [] of SDL::Rect

  getter sprite
  getter quads

  # How do you make a "Class variable initializer?"
  def initialize(texture_filename : String, width : Int32, height : Int32)
    @sprite = Leafgem::AssetManager.image(texture_filename)
    @quads = Leafgem::Spritesheet.make_quads(@sprite.width, @sprite.height, width, height)
  end

  def self.make_quads(sprite_width : Int32, sprite_height : Int32, width : Int32, height : Int32) : Array(SDL::Rect)
    outputquads = [] of SDL::Rect
    (0..(sprite_height / height - 1).floor.to_i).each do |j|
      (0..(sprite_width / width - 1).floor.to_i).each do |i|
        outputquads << SDL::Rect[i*width, j*height, width, height]
      end
    end
    return outputquads
  end
end
