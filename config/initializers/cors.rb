Rails.application.config.middleware.insert_before 0, Rack::Cors do
    p 'CORS configure'
    allow do
      origins '*' # Разрешить все домены, замените на конкретный домен при необходимости
  
      resource '*',
        headers: %w[Authorization Content-Type Blah],
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
  