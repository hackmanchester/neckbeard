# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Trail.create(name: 'Trail One')
Trail.create(name: 'Trail Two')
    
Exhibit.create(title: 'Fred', clue: 'first', pin: 'MOSI0014', sequence: 0)
Exhibit.create(title: 'sgaf', clue: 'second', pin: 'MOSI0013', sequence: 1)

User.create(score: 0)
