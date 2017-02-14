# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = City.create(name: 'Bielawa')
c2 = City.create(name: 'Nowhere')

s1 = Street.create(name: 'Jakakolwiek', city: c1)
s2 = Street.create(name: 'Jakakolwiek', city: c2)
s3 = Street.create(name: 'Inna', city: c1)


t = User.create(email: 't@t.t', first_name: 'First', last_name: 'Laster', password: '1234', city: c1)
a = User.create(email: 'a@t.t', first_name: 'Admino', last_name: 'Border', password: '1234', city: c2, ps_level: 4)
demo = User.create(email: 'demo@user.pl', first_name: 'Użytkownik', last_name: 'Zwykły', password: 'demo', city: c2,)
demo_admin = User.create(email: 'demo@user2.pl', first_name: 'Użytkownik', last_name: 'Kolejny', password: 'demo', city: c1)

d1 = Department.create(name: "D_1")
d2 = Department.create(name: "D_2")

DepartmentAssignment.create(department: d1, user: t)
DepartmentAssignment.create(department: d1, user: a)
DepartmentAssignment.create(department: d2, user: demo)

rc1 = ReportCategory.create(name: 'Porządek w mieście')
rc2 = ReportCategory.create(name: 'Problemy z elektrycznością')
rc3 = ReportCategory.create(name: 'Inne')

r1 = Report.create(title: 'Awaria awarii', 
                   city: c1, 
                   street: s1, 
                   descr: 'Lorem ipsum nic sie nie stalo', 
                   ip: '0.0.0.666', 
                   user: t, 
                   report_image: '',
                   report_category: rc1)

r2 = Report.create(title: 'Awaria oświetlenia', 
                   city: c1, 
                   street: s2, 
                   descr: 'Lorem ipsum dolor sit amet consequentis lot.', 
                   ip: '192.168.0.1', 
                   user: a, 
                   department: d1,
                   report_category: rc2)

r3 = Report.create(title: 'Dzikie wysypisko', 
                   city: c1, 
                   street: s3, 
                   descr: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dolor tortor, interdum sit amet rhoncus. ', 
                   ip: '192.168.1.1', 
                   user: demo, 
                   report_category: rc3)
                   
r4 = Report.create(title: 'Nieprzejezdna droga', 
                   city: c1, 
                   street: s3, 
                   descr: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pretium ullamcorper tortor, sed dignissim nunc. ', 
                   ip: '192.168.2.1', 
                   user: t, 
                   report_category: rc2)
                   
r5 = Report.create(title: 'Lorem ipsum dolor sit amet.', 
                   city: c1, 
                   street: s2, 
                   house: '2',
                   descr: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam fermentum id neque eu rhoncus. Aenean.', 
                   ip: '192.168.3.1', 
                   user: t, 
                   report_category: rc2)
                   
r6 = Report.create(title: 'Zniszczone ławki w parku', 
                   city: c1, 
                   street: s1, 
                   descr: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi placerat vitae lacus non tincidunt. Cum.', 
                   ip: '192.168.5.1', 
                   user: t,
                   report_category: rc2)
                   
r7 = Report.create(title: 'Nieprzejezdna droga', 
                   city: c1, 
                   street: s1, 
                   descr: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis molestie hendrerit auctor. Mauris eget placerat.', 
                   ip: '192.168.4.1', 
                   user: t, 
                   report_category: rc2)
                   
