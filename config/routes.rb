Rails.application.routes.draw do
  #eateiesコントローラ
  get 'eateries', to:'eateries#index'#飲食店一覧ページ
  get 'find', to: 'eateries#find'#飲食店を探すページ
  get 'eateries/new', to: 'eateries#new'#飲食店を登録するページ
  post 'eateries', to:'eateries#create'
  #usersコントローラ　
  get 'mypage', to:'users#me'#mypageにアクセスでuserコントローラのmeが呼ばれる
  get 'signup', to:'users#new'
  
  
  #sessionsコントローラ 主にログイン状態の保持のために使用
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index' 
  resources :users, only: %i[new create]
end
