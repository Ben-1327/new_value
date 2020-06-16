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


  resources :users, only: [:show, :edit, :update, :index] do
  	resource :follows, only: [:create, :destroy, :follow_list, :follower_list]
    # フォローとアンフォロー機能
    put 'follow' => 'follows#follow'
    put 'unfollow' => 'follows#unfollow'

    # フォロー・フォロワーの一覧ページ
    get 'follow_list' => 'follows#follow_list'
    get 'follower_list' => 'follows#follower_list'
  end

  resources :self_analyses, only: [:show, :edit, :update, :new, :destroy] do
    resources :self_analysis_comments, only: [:create, :destroy]
  end

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
