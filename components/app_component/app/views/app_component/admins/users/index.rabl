attributes :id, :email
collection users.map { |user| present(user) }
