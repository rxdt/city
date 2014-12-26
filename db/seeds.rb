# Roles

Role.create name: 'client'
Role.create name: 'admin'


# Default users

User.create(email: 'admin@test.org', password: 'password', password_confirmation: 'password').add_role(:admin).skip_confirmation!
User.create(email: 'client@test.org', password: 'password', password_confirmation: 'password').add_role(:client).skip_confirmation!


# Default screens
Screen.create screen_name: 'Screen Name 1'
Screen.create screen_name: 'Screen Name 2'
Screen.create screen_name: 'Screen Name 3'
Screen.create screen_name: 'Screen Name 4'
Screen.create screen_name: 'Screen Name 5'
