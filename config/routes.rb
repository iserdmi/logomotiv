ActionController::Routing::Routes.draw do |map|
  map.resources :albums
  

  map.resources :users


  #map.connect 'admin', :controller => :admin, :action => :index
  map.namespace :admin do |admin|
    admin.root :controller => :pages, :action => :new
    admin.connect 'pages/list_parent/:id', :controller => :pages, :action => :list_parent
    admin.connect 'pages/sort', :controller => :pages, :action => :sort
    admin.connect 'items/list/:page_id', :controller => :items, :action => :list
    admin.connect 'pages/context_menu/:id', :controller => :pages, :action => :context_menu
    admin.connect 'items/add_related_item_to_item/:id', :controller => :items, :action => :add_related_item_to_item
    admin.connect 'items/remove_item_relation/:id', :controller => :items, :action => :remove_item_relation
    admin.resources :pages, :news, :posts, :albums, :clients, :projects, :photos, :blocks
    admin.resources :images, :collection => {:sort => :any}
    
#    admin.resources :blocks, :active_scaffold => true
#    admin.resources :assets, :attachings, :active_scaffold => true
#    admin.resource :gallery, :controller => :gallery

    #admin.resources :sessions
    admin.logout 'logout', :controller => 'sessions', :action => 'destroy'
    admin.login 'login', :controller => 'sessions', :action => 'new'
    admin.signin 'signin', :controller => 'sessions', :action => 'create'
  end

  map.connect 'portfolio', :controller => :portfolio
  map.connect 'portfolio/:section', :controller => :portfolio, :action => :section
  map.connect 'portfolio/:section/:action', :controller => :portfolio
  map.connect 'portfolio/:section/p/:slug', :controller => :portfolio, :action => :show



  
  
  map.root :controller => :pages, :action => :index
  map.resources :pages
  Page.all.each do |p|
    map.connect p.path, :controller => :pages, :action => :show, :id => p.id unless p.path.nil?
  end
  
  map.connect ':controller/:action'
  map.connect ':path', :controller => :redirect
end
