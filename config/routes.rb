Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: "public/users", controllers:{
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords'
}
  devise_for :companies,path: "public/companies", controllers:{
  registrations: 'companies/registrations',
  sessions: 'companies/sessions',
  passwords: 'companies/passwords'
}

root 'public/homes#top'

namespace :public do
  get 'about' => 'homes#about'
  get 'rule' => 'homes#rule'
  get 'all_index' => 'self_analyses#all_index'
  get 'follow_index' => 'self_analyses#follow_index'
  get 'search' => 'searches#search'


  resources :users, only: [:index, :show, :edit, :update, :index] do
    # フォローとアンフォロー機能
    put 'follow' => 'follows#follow'
    put 'unfollow' => 'follows#unfollow'
    # フォロー・フォロワーの一覧ページ
    get 'follow_list' => 'follows#follow_list'
    get 'follower_list' => 'follows#follower_list'

    get 'user_part_index/:analysis_part_id' => 'self_analyses#follow_index'

    resources :self_analyses, only: [:show, :edit, :new, :update, :destroy] do
      resources :self_analysis_comments, only: [:create, :destroy]
      resource :favorites, only: [:create,:destroy]
    end

    resource :follows, only: [:create, :destroy, :follow_list, :follower_list]
  end



  resources :companies, only: [:show] do
    # フォローとアンフォロー機能
    put 'follow' => 'follows#follow'
    put 'unfollow' => 'follows#unfollow'
    # フォローの一覧ページ
    get 'follow_list' => 'follows#follow_list'
  end


  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
