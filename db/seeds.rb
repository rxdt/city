# Roles

Role.create name: 'client'
Role.create name: 'admin'


# Default users

User.create(email: 'admin@test.org', password: 'password', password_confirmation: 'password').add_role :admin
User.create(email: 'client@test.org', password: 'password', password_confirmation: 'password').add_role :investor
