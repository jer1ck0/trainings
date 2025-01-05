Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Разрешить все домены, замените на конкретный домен при необходимости
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
  