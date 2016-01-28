require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }

    it { should have_many(:labelings) }
    it { should have_many(:labels).through(:labelings) }

    it { should have_many(:comments) }
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:user) }
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:body).is_at_least(20) }

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
