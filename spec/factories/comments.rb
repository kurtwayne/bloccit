FactoryGirl.define do
   factory :comment do
     body 'Comment Body'
     post
     user
     rank 0.0
   end
 end
