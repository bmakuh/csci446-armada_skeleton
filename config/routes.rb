ActionController::Routing::Routes.draw do |map|
  map.resources :favorites

  map.resources :velociraptors

  map.root :velociraptors
  #map.root :controller => "application", :action => "show"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  
  map.register 'register', :controller => 'users', :action => 'new'
  map.resources :users, :only => [:new, :create]

  map.namespace :admin do |admin|
    admin.resources :roles
    admin.resources :users
    admin.resources :velociraptors
    admin.root :controller => 'admin', :action => 'index'
  end

  map.namespace :members do |members|
    members.resources :users, :only => [:show, :edit, :update]
    members.resources :velociraptors
    members.resources :favorites, :collection => { :toggle => :get }
    members.root :controller => 'members', :action => 'index'
  end

end
