require "./snappy/*"

module Snappy
  class Error < Exception
  end

  def self.deflate(slice : Slice(UInt8))
    output_length = LibSnappy.snappy_max_compressed_length(slice.size)
    output = Slice(UInt8).new(output_length)

    result = LibSnappy.snappy_compress(slice, slice.size, output, pointerof(output_length))
    if result != LibSnappy::SnappyStatus::SnappyOk
      raise Snappy::Error.new
    end
    output[0, output_length]
  end

  def self.inflate(slice : Slice(UInt8))
    result = LibSnappy.snappy_uncompressed_length(slice, slice.size, out output_length)

    if result != LibSnappy::SnappyStatus::SnappyOk
      raise Snappy::Error.new
    end

    output = Slice(UInt8).new(output_length)

    result = LibSnappy.snappy_uncompress(slice, slice.size, output, pointerof(output_length))

    if result != LibSnappy::SnappyStatus::SnappyOk
      raise Snappy::Error.new("Result: #{result}")
    end
    output[0, output_length]
  end

  def self.valid?(slice : Slice(UInt8))
    result = LibSnappy.snappy_validate_compressed_buffer(slice, slice.size)

    result == LibSnappy::SnappyStatus::SnappyOk
  end
end
