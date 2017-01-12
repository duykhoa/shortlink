class Base16Converter
  BASE = 16

  def encode(value)
    value.to_s(BASE)
  end

  def decode(value)
    value.to_i(BASE)
  end
end
