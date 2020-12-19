Rails.application.routes.draw do
  get'mypage', to:'users#me'#mypageにアクセスでuserコントローラのmeが呼ばれる
  
  post 'login', to: 'sessions#create'
  get 'auth', to: 'users#auth'
  delete 'logout', to:'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index' 
  resources :users, only: %i[new create]
end
