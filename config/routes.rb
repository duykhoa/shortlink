Rails.application.routes.draw do
  get "/shorten_url", to: "urls#shorten"
  get "/full_url", to: "urls#full_url"
end
