# Roles
Role.find_or_create_by name: 'client'
Role.find_or_create_by name: 'admin'

# Default users
User.create!(email: 'admin@test.org', password: 'password', password_confirmation: 'password').add_role(:admin) unless User.exists?(email: 'admin@test.org')
User.create!(email: 'client@test.org', password: 'password', password_confirmation: 'password').add_role(:client) unless User.exists?(email: 'client@test.org')

# Default screens
Screen.create screen_name: 'Screen Name 1'
Screen.create screen_name: 'Screen Name 2'
Screen.create screen_name: 'Screen Name 3'
Screen.create screen_name: 'Screen Name 4'
Screen.create screen_name: 'Screen Name 5'
