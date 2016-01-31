Rails.application.routes.draw do

resources :ratings, only: [:show]

resources :labels, only: [:show]

resources :advertisements

resources :questions do
  resources :answers
end

resources :topics do
  resources :posts, :sponsored_posts, except: [:index]
end

resources :posts, only: [] do
  resources :comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote
end

resources :users, only: [:new, :create]
post 'users/confirm' => 'users#confirm'

resources :sessions, only: [:new, :create, :destroy]

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
