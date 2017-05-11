# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

companies = Company.create([
{
  name: 'None',
  happiness_score: 0,
  happiness_users: 0,
  health_score: 0,
  health_users: 0,
  friendliness_score: 0,
  friendliness_users: 0,
  difficulty_score: 0,
  difficulty_users: 0
},
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
},
{
  name: 'Cali Bro\'s Inc',
  happiness_score: 50,
  happiness_users: 10,
  health_score: 75,
  health_users: 10,
  friendliness_score: 90,
  friendliness_users: 10,
  difficulty_score: 100,
  difficulty_users: 10
}
])

users = User.create([
{
  email: 'alphabro@10x.com',
  password: '10x',
  company_id: companies[2].id,
  name: 'AlphaBro'
},
{
  email: 'chadd@liatrio.com',
  password: 'shane23237',
  company_id: companies[1].id,
  name: 'Chadworth'
},
{
  email: 'hunterm@liatrio.com',
  password: '10X',
  company_id: companies[1].id,
  name: 'HunterXXXMega'
},

{
  email: 'jeffg@liatrio.com',
  password: 'xXjoe1337Xx',
  company_id: companies[1].id,
  name: 'J-Guzz'
},
{
  email: 'shanem@liatrio.com',
  password: '123',
  company_id: companies[1].id,
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
  users_id: users[4].id,
  taken: false,
  question1: 0,
  question2: 1,
  question3: 2
},
{
  users_id: users[1].id,
  taken: false,
  question1: 3,
  question2: 4,
  question3: 5
},
{
  users_id: users[2].id,
  taken: false,
  question1: 6,
  question2: 7,
  question3: 8
}])
