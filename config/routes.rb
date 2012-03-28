CmsRails::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :staffs

  resources :announcements

  resources :projects do
    resources :resources, :shallow => true
  end

  
  
  resources :sessions
  
  resources :users
  
  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout

  match 'admin/users/:id/create_admin' => "admins#create", :as => :create_admin, :via => :get
  match 'admin/users/:id/destroy_admin' => "admins#destroy", :as => :remove_admin, :via => :get
  
  match 'admin/users/:id/change' => "admins#change", :as => :change, :via => :get

  match 'contributions/create/:project_id/:user_id' => "contributions#create", :as => :join_project, :via => :get

  match 'mobile' => "mobile#index"
  

  root :to => 'sessions#new'

end
