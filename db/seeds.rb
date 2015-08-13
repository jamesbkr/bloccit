# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

50.times do 
    Post.create!(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph
        
        
        )
end

posts = Post.all

100.times do
    Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
    
end
random = Random.new

50.times do
    Advertisement.create!(
        title: Faker::Lorem.sentence,
        copy: Faker::Lorem.paragraph,
        price: random.rand(500)
        )
end



Post.where(title: "THIS IS THE UNIQUE SEED", body: "THIS IS THE UNIQUE SEED").first_or_create


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"