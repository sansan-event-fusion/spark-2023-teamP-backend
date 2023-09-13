Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost:8080"

    resource "*",
      headers: :any,
      expose: ["Authorization", "access-token", "client", "expiry", "uid", "token-type"],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
