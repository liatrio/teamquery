# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
surveys = Survey.create(
  [
    {name: 'survey 1', happiness_level: 0, health_level: 0, friend_level: 0, difficulty_level: 0, taken: false},
    {name: 'survey 2', happiness_level: 6, health_level: 7, friend_level: 6, difficulty_level: 9, taken: true}
  ]
)
