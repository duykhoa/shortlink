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
end
