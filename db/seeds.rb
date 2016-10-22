# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t = User.create(email: 't@t.t', first_name: 'First', last_name: 'Laster', password: '1234', city: 'nowhere')
a = User.create(email: 'a@t.t', first_name: 'Admino', last_name: 'Border', password: '1234', city: 'everywhere', is_admin: true)

rc1 = ReportCategory.create(name: 'Porządek w mieście')
rc2 = ReportCategory.create(name: 'Problemy z elektrycznością')
rc3 = ReportCategory.create(name: 'Inne')

c1 = City.create(name: 'Bielawa')

r1 = Report.create(title: 'Awaria awarii', city: c1, street: 'Uliczka', desc: 'Lorem ipsum nic sie nie stalo', ip: '0.0.0.666', user: t, report_category: rc1)
