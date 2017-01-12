class UrlsController < ApplicationController
  STATUS_CODE = 200

  def shorten
    short_url = shorten_url_service.shorten(url)
    render json: response_for(short_url)
  end

  def full_url
    full_url = shorten_url_service.full_url(url)
    render json: response_for(full_url)
  end

  def response_for(url)
    {
      status: STATUS_CODE,
      url: url
    }
  end

  def url
    params[:url]
  end

  def shorten_url_service
    ShortenUrl.new
  end
end
