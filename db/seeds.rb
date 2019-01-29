# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create(name: 'Michelada')

database = Database.new
database.host = 'localhost'
database.name = "michelada_#{Rails.env}"
database.company = Company.find_by(name: 'Michelada')
database.save

Company.create(name: 'Wdt')
# Database information for michelada
database = Database.new
database.host = 'localhost'
database.name = "wdt_#{Rails.env}"
database.company = Company.find_by(name: 'Wdt')
database.save