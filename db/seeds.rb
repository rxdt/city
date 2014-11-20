# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create({ email: 'investor@test.org',
                  password: 'password', password_confirmation: 'password' })
u.skip_confirmation!
u.add_role :investor

u = User.create({ email: 'admin@test.org',
                  password: 'password', password_confirmation: 'password' })
u.skip_confirmation!
u.add_role :admin
