# Roles

Role.create name: 'investor'
Role.create name: 'admin'


# Default users

User.create(email: 'admin@test.org', password: 'password', password_confirmation: 'password').add_role :admin
User.create(email: 'investor@test.org', password: 'password', password_confirmation: 'password').add_role :investor
