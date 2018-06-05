Rails.application.routes.draw do
  root 'staticpages#home'

  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tasks
  end

end

