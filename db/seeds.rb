# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
    user = User.new
    
        user.email = "foo1#{i}@bar.com"
        user.password = 'password'
        user.password_confirmation = 'password'
        user.username = "fubar#{i}"
        user.dob = "13/10/199#{i}"
        user.save!
    end