Rails.application.routes.draw do
  get 'eatery', to:'eateries#index'#飲食店一覧ページ
  get 'find', to: 'eateries#find'#飲食店を探すページ
  get 'share', to: 'eateries#share'#飲食店を登録するページ
  
  get 'mypage', to:'users#me'#mypageにアクセスでuserコントローラのmeが呼ばれる
  get 'signup', to:'users#new'
  get 'login', to: 'users#login'
  
  post 'authenticated', to: 'sessions#create'
  
  delete 'logout', to:'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index' 
  resources :users, only: %i[new create]
end
