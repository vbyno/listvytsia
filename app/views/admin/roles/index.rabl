extends 'admin/roles/role'
collection roles.map { |role| present(role) }
