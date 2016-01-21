Rails.application.routes.draw do

resources :advertisements

resources :questions do
  resources :answers
end

resources :topics do
resources :posts, :sponsored_posts, except: [:index]
end

resources :users

resources :comments

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
get 'advertisements' => 'welcome#advertisements'
get 'topics' => 'welcome#topics'

  root 'welcome#index'
end
