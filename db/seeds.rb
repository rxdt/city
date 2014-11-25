# Roles

Role.create name: 'investor'
Role.create name: 'admin'


# Default users

User.create(email: 'admin@test.org', password: 'password', password_confirmation: 'password').add_role :admin
User.create(email: 'investor@test.org', password: 'password', password_confirmation: 'password').add_role :investor


# Default deals
Deal.create company_name: 'Company Name 1', blurb: 'lorem ipsum 1'
Deal.create company_name: 'Company Name 2', blurb: 'lorem ipsum 2'
Deal.create company_name: 'Company Name 3', blurb: 'lorem ipsum 3'
Deal.create company_name: 'Company Name 4', blurb: 'lorem ipsum 4'
Deal.create company_name: 'Company Name 5', blurb: 'lorem ipsum 5'
Deal.create company_name: 'Company Name 6', blurb: 'lorem ipsum 6'
Deal.create company_name: 'Company Name 7', blurb: 'lorem ipsum 7'
