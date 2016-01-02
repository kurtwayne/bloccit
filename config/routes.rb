Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/faq'

  root 'welcome#index'
end
