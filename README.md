# TTF2EOT

`TTF2EOT` provides ruby bindings for [http://code.google.com/p/ttf2eot/](ttf2eot).

## Usage

There's just one method available: `TTF2EOT.convert`. It accepts a path or IO
object for the source `TTF` file, and a path or IO object for the `EOT` file.

    TTF2EOT.convert("input.ttf", "output.eot")
    # => #<File:output.eot>

    input = StringIO.new(File.read("input.ttf"))
    output = StringIO.new
    TTF2EOT.convert(input, output)
    # => #<StringIO:0x007f815a83a210>
