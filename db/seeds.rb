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

# Assign #30 - Assign unique post/comment and checking whether it already exsists
#puts "#{Post.count}"
#Post.find_or_create_by(title: "The Title", body: "The Body")
#puts "#{Post.count}"

#puts "#{Comment.count}"
#Post.find_or_create_by(title: "Test Title", body: "Test Body")
#puts "#{Comment.count}"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
