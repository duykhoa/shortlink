class UrlsController < ApplicationController
  STATUS_CODE = 200

  def index
    urls = ShortUrl.all_by_user_id(user_id)
    render json: response_for_all_urls(urls)
  end

  def shorten
    short_url = shorten_url_service.shorten(url, user_id)
    render json: response_for(short_url)
  end

  def full_url
    full_url = shorten_url_service.full_url(url)
    render json: response_for(full_url)
  end

  def response_for_all_urls(urls)
    {
      status: STATUS_CODE,
      urls: urls
    }
  end

  def response_for(url)
    {
      status: STATUS_CODE,
      url: url
    }
  end

  def user_id
    params[:user_id]
  end

  def url
    params[:url]
  end

  def shorten_url_service
    ShortenUrl.new
  end
end
