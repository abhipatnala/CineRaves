Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trakt, '6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4', '5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1'
end