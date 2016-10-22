# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t = User.create(email: 't@t.t', first_name: 'First', last_name: 'Laster', password: '1234', city: 'nowhere')
a = User.create(email: 'a@t.t', first_name: 'Admino', last_name: 'Border', password: '1234', city: 'nowhere', is_admin: true)
