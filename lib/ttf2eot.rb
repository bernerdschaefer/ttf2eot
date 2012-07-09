module TTF2EOT
  # Public: Converts a TTF font file to an EOT font.
  #
  # input  - the input TTF font as a String (representing a path) or IO object
  #          (responding to #read).
  # output - the output destination as a String (representing a path) or IO
  #          object where the EOT font will be written.
  #
  # Examples:
  #
  #   TTF2EOT.convert("input.ttf", "output.eot")
  #   # => #<File:output.eot>
  #
  #   input = StringIO.new(File.read("input.ttf"))
  #   output = StringIO.new
  #   TTF2EOT.convert(input, output)
  #   # => #<StringIO:0x007f815a83a210>
  #
  # Returns the output IO object.
  # Raises TTF2EOT::ConversionError if the input data is invalid.
  def convert(input, output)
    input = File.open(input, "rb") unless input.respond_to?(:read)
    output = File.open(output, "wb") unless output.respond_to?(:write)

    source = input.read
    header = eot_header(source)

    output.write header
    output.write source
    output.flush

    output
  end
  module_function :convert

  # Internal: Get an EOT header for a TTF font.
  #
  # font_data - a String containing valid TTF font data.
  #
  # Returns a String with the EOT header for the input data.
  # Raises TTF2EOT::ConversionError if the input data is invalid.
  def eot_header(font_data)
    raise NotImlementedError, "this method is defined by the ttf2eot c extension"
  end
end

require "ttf2eot_ext"
