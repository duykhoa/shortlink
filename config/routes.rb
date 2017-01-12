Rails.application.routes.draw do
  get "/shorten", to: "urls#shorten"
  get "/full_url", to: "urls#full_url"
end
