class ShortenUrl
  SHORT_URL_BASE = "http://short.link"
  SHORT_URL_FORMAT = "%<base>s/%<short_id>s"

  def initialize(options = {})
    @encode_strategy = options[:encode_strategy] || Base16Converter.new
  end

  def shorten(url, user_id = nil)
    short_url = ShortUrl.find_or_create_by(full_url: url, user_id: user_id)

    SHORT_URL_FORMAT % {
      base: SHORT_URL_BASE,
      short_id: @encode_strategy.encode(short_url.id)
    }
  end

  def full_url(short_url)
    id = short_url.split("/")[-1]
    return nil unless id
    short_url = ShortUrl.find_by_id(@encode_strategy.decode(id))
    short_url ? short_url.full_url : nil
  end
end
