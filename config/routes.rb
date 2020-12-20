Rails.application.routes.draw do
  #eateiesコントローラ
  get 'eatery', to:'eateries#index'#飲食店一覧ページ
  get 'find', to: 'eateries#find'#飲食店を探すページ
  get 'reg', to: 'eateries#new'#飲食店を登録するページ
  
  #usersコントローラ　
  get 'mypage', to:'users#me'#mypageにアクセスでuserコントローラのmeが呼ばれる
  get 'signup', to:'users#new'
  get 'login', to: 'users#auth'
  
  #sessionsコントローラ 主にログイン状態の保持のために使用
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index' 
  resources :users, only: %i[new create]
end
