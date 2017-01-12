# Public: A encode strategy, convert the id of ShortUrl entity to Base16
#   It is injected in ShortenUrl service
#
# Examples
#
#   base16_converter = Base16Converter.new
#   shorten_url_service = ShortenUrl.new(encode_strategy: base16_converter)
class Base16Converter
  BASE = 16

  # Public: convert a Numeric to base 16 string
  #
  #   value - The Integer to convert to base 16
  #
  # Examples
  #
  #   base16_converter = Base16Converter.new
  #   base16_converter.encode(1) #=> '1'
  #   base16_converter.encode(15) #=> 'f'
  #   base16_converter.encode(17) #=> '11'
  #
  # Returns a String base 16
  def encode(value)
    value.to_s(BASE)
  end

  # Public: convert a String base16 to integer
  #
  #   base16_string - The String in base 16 to convert
  #
  # Examples
  #
  #   base16_converter = Base16Converter.new
  #   base16_converter.decode('1') #=> 1
  #   base16_converter.decode('10') #=> 16
  #
  # Returns a Integer
  def decode(base16_string)
    base16_string.to_i(BASE)
  end
end
