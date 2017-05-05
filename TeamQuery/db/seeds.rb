# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

companies = Company.create([
{
  name: 'Liatrio', 
  happiness_score: 0,
  happiness_users: 0,
  health_score: 0,
  health_users: 0,
  friendliness_score: 0,
  friendliness_users: 0,
  difficulty_score: 0,
  difficulty_users: 0
}])

users = User.create([
{
  email: 'chadd@liatrio.com',
  password: 'shane23237',
  company_id: companies[0].id,
  name: 'Chadworth'
},
{
  email: 'hunterm@liatrio.com',
  password: '10X',
  company_id: companies[0].id,
  name: 'HunterXXXMega'
},

{
  email: 'jeffg@liatrio.com',
  password: 'xXjoe1337Xx',
  company_id: companies[0].id,
  name: 'J-Guzz'
},
{
  email: 'shanem@liatrio.com',
  password: '123',
  company_id: companies[0].id,
  name: 'S. MacBride'
}])

questions = Question.create([
{
  text: 'How satisfied are you with the work that you do at your company?',
  trait: 'happiness'
},
{
  text: 'How happy are you with your work station?',
  trait: 'happiness'
},
{
  text: 'How many apples have you eaten recently?',
  trait: 'health'
},
{
  text: 'How much coffee have you drank in the last week?',
  trait: 'health'
},
{
  text: 'How many times this week have you gotten a couple brews with the boys?',
  trait: 'friendliness'
},
{
  text: 'If a tiger got loose from the Chico Zoo, how likely are you to rely on your coworkers for safety?',
  trait: 'friendliness'
},
{
  text: 'How challenging is your day to day work?',
  trait: 'difficulty'
},
{
  text: 'How easy is it for you to get into contact with your managers?',
  trait: 'difficulty'
}])

surveys = Survey.create([
{
  users_id: users[0],
  questions_id: [questions[0], questions[2], questions[4]],
  taken: false
},
{
  users_id: users[1],
  questions_id: [questions[1], questions[3], questions[5]],
  taken: false
},
{
  users_id: users[2],
  questions_id: [questions[4], questions[6], questions[7]],
  taken: false
}])
