include RandomData

# Create Posts
50.times do
  # #1 we use "!" or bang to raise an error during seeding
  Post.create!(
  # #2 RandomData method is not yet created, called "wishful coding"
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
# #3 "times" runs the block the specified number of times
100.times do
  Comment.create!(
  # #4 "sample" returns a random element from the array
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

puts "#{Post.count}"
Post.find_or_create_by(title: :"The Title", body: "The Body")
puts "#{Post.count}"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
