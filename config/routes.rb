Rails.application.routes.draw do

# We call the resources method and pass it a Symbol. This instructs Rails
# to create post routes for creating, updating, viewing, and deleting instances
# of Post.

resources :posts do
  resources :comments
end

resources :questions do
  resources :answers
end

# We remove get "welcome/index" because we've declared the index view as
# the root view. We also modify the about route to allow users to visit /about, rather
# than /welcome/about.

get 'about' => 'welcome#about'
get 'contact' => 'welcome#contact'
get 'faq' => 'welcome#faq'
get 'questions' => 'welcome#questions'

  root 'welcome#index'
end
