Rails.application.routes.draw do
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

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
