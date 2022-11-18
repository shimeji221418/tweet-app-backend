# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name:"test", email:"test@gmail.com", uid:"test")
User.create!(name:"test2", email:"test2@gmail.com", uid:"test2")

Post.create!(title:"test1", body:"test1body", user_id: 1)
Post.create!(title:"test2", body:"test2body", user_id: 2)
