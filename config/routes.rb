Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  # new create destroyアクションは作らない
  resource :user, except: [:new, :create, :destroy]
  resources :recipes do 
    resource :favorites, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
