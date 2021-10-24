Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_KEY"], ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true

    OmniAuth.config.allowed_request_methods = [:post, :get]
    OmniAuth.config.silence_get_warning = true
  end
  