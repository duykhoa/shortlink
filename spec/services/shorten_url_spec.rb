require 'rails_helper'

describe ShortenUrl do
  let(:shorten_service) { ShortenUrl.new }

  describe "can shorten link" do
    it "short a new link" do
      full_url = "http://google.com"
      short_url = shorten_service.shorten(full_url)
      expect(short_url).to eq "http://short.link/1"
    end

    it "full url was shorten before" do
      full_url = "http://google.com"
      short_url = shorten_service.shorten(full_url)
      short_url = shorten_service.shorten(full_url)
      expect(short_url).to eq "http://short.link/1"
    end
  end

  describe "get full url back" do
    it "get full_url of existed short url" do
      full_url = "http://google.com"
      short_url = shorten_service.shorten(full_url)

      expect(shorten_service.full_url(short_url)).to eq full_url
    end

    it "get full_url of non existed short url" do
      short_url = "http://short.link/undefined"
      expect(shorten_service.full_url(short_url)).to be nil
    end
  end
end
