#!/usr/bin/env ruby
require 'json'
require 'rubygems'
require 'chunky_png'

TRANSPARENT = [255,0,255]
CONVERT_TRANSPARENT = true

if ARGV.length != 2
  puts "You need to enter the name of file to convert and the output."
  puts "./#{$0} [input.txt] [output.json]\n"
  exit 1
end

input_file = ARGV[0]
output_file = ARGV[1]

sprite_map = {}
def convert_image(img)
  image = ChunkyPNG::Image.from_file img
  (0..image.dimension.width-1).each do |x|
    (0..image.dimension.height-1).each do |y|
    if TRANSPARENT == [ChunkyPNG::Color.r(image[x,y]), ChunkyPNG::Color.g(image[x,y]), ChunkyPNG::Color.b(image[x,y])]
        image[x,y] = ChunkyPNG::Color.rgba(0, 0, 0,0)
      end
    end
    image.save img
  end
end

def extract_line(sprite_map, line)
  pieces = line.split(",")
  sprite_map[pieces[0]] = [] unless sprite_map[pieces[0]]
  sprite_map[pieces[0]][pieces[1].to_i] = {
    image: pieces[2].strip,
    xoffset: -pieces[3].to_i,
    yoffset: -pieces[4].to_i
  }
  convert_image pieces[2].strip if CONVERT_TRANSPARENT
end

text=File.open(input_file).read
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
  extract_line sprite_map, line
end

sprite_map.each_key{ |key| 
  sprite_map[key].compact!
}

sp ={ spritepack: sprite_map }

File.open(output_file,"w") do |f|
  f.write(JSON.pretty_generate(sp))
end

