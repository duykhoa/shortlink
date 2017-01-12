class UrlsController < ApplicationController
  def shorten
    short_url = shorten_url_service.shorten(full_url)
    render json: response_for(short_url)
  end

  def response_for(short_url)
    {
      status: 200,
      short_url: short_url
    }
  end

  def full_url
    params[:full_url]
  end

  def shorten_url_service
    ShortenUrl.new
  end
end
