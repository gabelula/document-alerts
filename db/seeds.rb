# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DocumentType.create([{ name: 'Oficial'}, {name: 'AFSCA'}])

u = User.new
u.email = "document@gmail.com"
u.password = "password"
u.save