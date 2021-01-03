Rails.application.routes.draw do
  get 'reviews/new', to: 'reviews#new'
  get 'reviews/destroy', to: 'reviews#destory'
  resources :reviews, only: [:new, :create, :destroy]
  #eateriesコントローラ
  
  get 'eateries', to:'eateries#index'#飲食店一覧ページ
  get 'eateries/new', to: 'eateries#new'#飲食店を登録するページ
  get 'eateries/find', to: 'eateries#find'#APIで店舗を検索した結果を表示するページ
  get 'eateries/all', to: 'eateries#all'
  get 'eateries/category', to: 'eateries#category'
  get 'eateries/search', to: 'eateries#search'#bumeshiに登録されているデータを検索する
  post 'eateries', to:'eateries#create'
  get 'eateries/:id', to: 'eateries#show'
  
  resources :eateries, only: [:index, :new, :create, :show]
  
  #usersコントローラ　
  get 'mypage', to: 'users#me'#mypageにアクセスでuserコントローラのmeが呼ばれる
  get 'auth/:provider/callback', to: 'users#signin'
  patch 'users/create', to: 'users#create'
  resources :users, only: [:new, :create]
  
  #sessionsコントローラ 主にログイン状態の保持のために使用
  #get 'auth/:provider/callback', to: 'sessions#create'
  delete 'signout', to:'sessions#destroy', as: 'signout'
  
  root 'eateries#index' 
  
end
