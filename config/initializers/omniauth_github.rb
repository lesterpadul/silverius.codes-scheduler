Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, 
        "Iv1.0ac2f71ffa65c4a3", 
        "de56900f948633e1ce8bca21d8a3e064f08ad1f7"
end