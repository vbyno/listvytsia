attributes :id, :title
collection roles.map { |role| present(role) }
