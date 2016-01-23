@[Link("snappy")]
lib LibSnappy
  enum SnappyStatus
    SnappyOk = 0
    SnappyInvalidInput = 1
    SnappyBufferTooSmall = 2
  end

  fun snappy_max_compressed_length(source_length : LibC::SizeT) : LibC::SizeT
  fun snappy_compress(input : LibC::Char*, input_length : LibC::SizeT, compressed : LibC::Char*, compressed_length : LibC::SizeT*) : SnappyStatus

  fun snappy_uncompressed_length(compressed : LibC::Char*, compressed_length : LibC::SizeT, result : LibC::SizeT*) : SnappyStatus
  fun snappy_uncompress(compressed : LibC::Char*, compressed_length : LibC::SizeT, uncompressed : LibC::Char*, uncompressed_length : LibC::SizeT*) : SnappyStatus

  fun snappy_validate_compressed_buffer(compressed : LibC::Char*, compressed_length : LibC::SizeT) : SnappyStatus
end
