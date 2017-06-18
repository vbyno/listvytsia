unless Core::Admin.where(email: ENV['APP_ADMIN_EMAIL']).exists?
  Core::Admin.create(email: ENV['APP_ADMIN_EMAIL'], password: ENV['APP_ADMIN_PASSWORD'])
end
