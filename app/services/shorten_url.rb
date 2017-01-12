class ShortenUrl
  SHORT_URL_BASE = "http://short.link"
  SHORT_URL_FORMAT = "%<base>s/%<short_id>s"

  def shorten(url, user_id = nil)
    short_url = ShortUrl.find_or_create_by(full_url: url, user_id: user_id)

    SHORT_URL_FORMAT % {
      base: SHORT_URL_BASE,
      short_id: short_url.id
    }
  end

  def full_url(short_url)
    id = short_url.split("/")[-1]
    short_url = ShortUrl.find_by_id(id)
    short_url ? short_url.full_url : nil
  end
end
