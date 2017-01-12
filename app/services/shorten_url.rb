class ShortenUrl
  SHORT_URL_BASE = "http://short.link"
  SHORT_URL_FORMAT = "%<base>s/%<short_id>s"

  # Constructor ShortenUrl service
  #
  #   encode_strategy - the object handles responsibility to encode/decode
  #   the real id of short_url.
  #
  # Examples
  #
  #   # Use default converter
  #   ShortenUrl.new
  #
  #   # Specific the encode strategy (Base16Converter)
  #   ShortenUrl.new(encode_strategy: Base16Converter.new
  #
  #   More information about the encode_strategy object, checkout
  #   Base16Converter class
  def initialize(options = {})
    @encode_strategy = options[:encode_strategy] || Base16Converter.new
  end

  # Public: shorten a link
  #
  #   url     - The String full url needs to be shorten
  #   user_id - The Integer user_id, (default: nil)
  #
  # Examples
  #
  #   shorten_url_service = ShortenUrl.new
  #
  #   # Guest wants to shorten a url
  #   shorten_url_service.shorten("https://google.com") #=> "http://short.link/1"
  #
  #   # A user wants to shorten a url
  #   shorten_url_service.shorten("https://google.com", 1) #=> "http://short.link/1"
  #
  # Return a String of shorten url
  def shorten(url, user_id = nil)
    short_url = ShortUrl.find_or_create_by(full_url: url, user_id: user_id)

    SHORT_URL_FORMAT % {
      base: SHORT_URL_BASE,
      short_id: @encode_strategy.encode(short_url.id)
    }
  end

  # Public: get full url of a short url
  #
  #   short_url - The string short url
  #
  # Examples
  #
  #   shorten_url_service = ShortenUrl.new
  #   shorten_url_service.full_url("http://short.link/1") #=> "https://google.com"
  #
  # Return the String of full url
  def full_url(short_url)
    id = short_url.split("/")[-1]
    return nil unless id
    short_url = ShortUrl.find_by_id(@encode_strategy.decode(id))
    short_url ? short_url.full_url : nil
  end
end
