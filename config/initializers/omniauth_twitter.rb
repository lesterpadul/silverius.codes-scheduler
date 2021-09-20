Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :twitter, 
        "2atk9oPMj8xpaQkNZYpm9ywo5",
        "ze0wAQBhOugzZUzW9yoeYb9isCfJvZ5XbDoCqRYgPpOc8LolKR"
end