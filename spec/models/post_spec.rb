require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description:
    RandomData.random_paragraph) }
  let(:post) { Post.create!(title: RandomData.random_sentence, body:
    RandomData.random_paragraph) }

    it { should belong_to(:topic) }
# let method, makes the Post instance available through the rest of the spc, so we only need to instantiate it
  describe "attributes" do
# We test whether post has an attributed name title -- we want a non-nil value when called.
    it "should respond to title" do
      expect(post).to respond_to(:title)
    end
# We then apply a similar test here to the body -- we want a non-nil value when called.
    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
  end
end
