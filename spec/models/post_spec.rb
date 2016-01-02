require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
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
