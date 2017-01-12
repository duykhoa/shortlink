Rails.application.routes.draw do
  get "/shorten_url", to: "urls#shorten"
end
