# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
FeedItem.destroy_all
Profile.destroy_all
User.destroy_all

# Create 100 users, a profile for each user, and a post for each user
100.times do |i|
  user = User.create!(
    username: "User #{i + 1}",
    email: "user#{i + 1}@msudenver.edu",
    password: "password",
    password_confirmation: "password"
  )

  # Create a profile for each user
  Profile.create!(
    bio: "This is the bio of User #{i + 1}",
    user: user,
    active: true
  )

  # Create a post for each user
  FeedItem.create!(
    body: "This is a post by #{user.username}",
    likes: rand(1..100),
    user: user
  )
end

puts "Created 100 users, profiles, and a post for each user."