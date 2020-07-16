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
  get 'jhs_users' => 'users#jhs_users'
  get 'normal_users' => 'users#normal_users'
  get 'all_index' => 'self_analyses#all_index'
  get 'follow_index' => 'self_analyses#follow_index'
  get 'search' => 'searches#search'
  get 'self_analyses/new' => 'self_analyses#new'
  get 'self_analyses/part_select' => 'self_analyses#part_select'
  get 'self_analyses/step_select' => 'self_analyses#step_select'


  resources :users, only: [:index, :show, :edit, :update] do
    # フォローとアンフォロー機能
    put 'follow' => 'follows#follow'
    put 'unfollow' => 'follows#unfollow'
    # フォロー・フォロワーの一覧ページ
    get 'follow_list' => 'follows#follow_list'
    get 'follower_list' => 'follows#follower_list'

    get ':analysis_part_id/user_part_index' => 'self_analyses#user_part_index', as:'part_index'

    resources :self_analyses, only: [:show, :edit, :update, :destroy, :create] do
      resources :self_analysis_comments, only: [:create, :destroy]
      resource :favorites, only: [:create,:destroy]
    end

    resource :follows, only: [:create, :destroy, :follow_list, :follower_list]
  end



  resources :companies, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
  end


  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
