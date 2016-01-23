include RandomData

# Create Users
 5.times do
   User.create!(
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

# Create Topics
15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  # #1 we use "!" or bang to raise an error during seeding
  Post.create!(
  # #2 RandomData method is not yet created, called "wishful coding"
  user:   users.sample,
  topic: topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end
posts = Post.all

50.times do
  SponsoredPost.create!(
  topic: topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end
sponsored_posts = SponsoredPost.all

# Create Comments
# #3 "times" runs the block the specified number of times
100.times do
  Comment.create!(
  # #4 "sample" returns a random element from the array
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

50.times do
  Advertisement.create!(
  title: RandomData.random_sentence,
  copy: RandomData.random_paragraph
  )
end

100.times do
  Question.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  resolved: false
  )
end

# email and password to test login functionality
user = User.first
 user.update_attributes!(
   email: 'kurtwgardner@gmail.com',
   password: 'Helloworld'
 )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
