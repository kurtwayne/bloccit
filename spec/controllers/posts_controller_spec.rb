require 'rails_helper'
include RandomData

# RSpec created a test for PostsController. type: :controller tells RSpec to
# treat the test as a controller test. This allows us to simulate controller
# actions such as HTTP requests.

RSpec.describe PostsController, type: :controller do

# We create a post and assign it to my_post using let. We use RandomData to
# give my_post a random title and body.
  let(:my_post) { Post.create!(title: RandomData.random_sentence,
    body: RandomData.random_paragraph) }

  describe "GET index" do
    it "returns http success" do
# The test performs a GET on the index view and expects the response to be successful.
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
    get :index
# Because our test created one post (my_post), we expect index to return an
# array of one item. We use assigns, a method in ActionController::TestCase.
# assigns gives the test access to "instance variables assigned in the action
# that are available for the view".
    expect(assigns(:posts)).to eq([my_post])
  end
end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_post.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: my_post.id}
      expect(assigns(:post)).to eq(my_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantsiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "POST create" do

    it "increases the number of Post by 1" do
    expect{post :create, post: {title: RandomData.random_sentence,
      body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
  end

    it "assigns the new post to @post" do
      post :create, post: {title: RandomData.random_sentence,
      body: RandomData.random_paragraph}
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the new post" do
      post :create, post: {title: RandomData.random_sentence,
      body: RandomData.random_paragraph}
      expect(response).to redirect_to Post.last
    end
  end

  describe "GET edit" do
   it "returns http success" do
      get :edit, {id: my_post.id}
      expect(response).to have_http_status(:success)
   end

   it "renders the #edit view" do
     get :edit, {id: my_post.id}
     expect(response).to render_template :edit
   end

   it "assigns post to tbe updated to @post" do
     get :edit, {id: my_post.id}

     post_instance = assigns(:post)

     expect(post_instance.id).to eq my_post.id
     expect(post_instance.title).to eq my_post.title
     expect(post_instance.body).to eq my_post.body
   end
  end

  describe "PUT update" do
     it "updates post with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, id: my_post.id, post: {title: new_title, body: new_body}

       updated_post = assigns(:post)
       expect(updated_post.id).to eq my_post.id
       expect(updated_post.title).to eq new_title
       expect(updated_post.body).to eq new_body
     end

     it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, id: my_post.id, post: {title: new_title, body: new_body}
       expect(response).to redirect_to my_post
     end
   end

   describe "DELETE destroy" do
     it "deletes the post" do
       delete :destroy, {id: my_post.id}

       count = Post.where({id: my_post.id}).size
       expect(count).to eq 0
     end

     it "redirects to posts index" do
       delete :destroy, {id: my_post.id}

       expect(response).to redirect_to posts_path
     end
   end

end
