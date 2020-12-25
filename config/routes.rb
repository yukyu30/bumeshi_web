Rails.application.routes.draw do
  #eateriesコントローラ
  
  get 'eateries', to:'eateries#index'#飲食店一覧ページ
  get 'eateries/new', to: 'eateries#new'#飲食店を登録するページ
  get 'eateries/recent', to: 'eateries#recent'#最新のお店を取得する
  #get 'eateries/category', to: 'eateries#category'
  get 'eateries/search', to: 'eateries#search'
  post 'eateries', to:'eateries#create'
  get 'eateries/:id', to: 'eateries#show'
  
  
  resources :eateries, only: [:index, :new, :create, :show]
  
  #usersコントローラ　
  get 'mypage', to:'users#me'#mypageにアクセスでuserコントローラのmeが呼ばれる
  get 'signup', to:'users#new'
  
  
  #sessionsコントローラ 主にログイン状態の保持のために使用
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'eateries#index' 
  resources :users, only: %i[new create]
end
