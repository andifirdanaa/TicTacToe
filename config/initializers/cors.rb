Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://192.168.177:3000','localhost:3000'
      resource '*', headers: :any, methods: [:get, :post]
    end
end