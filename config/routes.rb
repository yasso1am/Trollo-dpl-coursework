Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'lists/index'
  get 'lists/show'
  get 'boards/index'
  get 'boards/show'
  get 'staticpages/home'
  root 'staticpages#home'

  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tastks
  end

end

