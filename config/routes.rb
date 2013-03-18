Chyldwelfare::Application.routes.draw do
  root :to => "users#splash"

  resources :users, :only => [:index, :new, :create]

  get "/donorlist" => 'users#dlist'
  get "/applist" => 'users#alist'

  get "/apply" => "users#applyf"
  put "/apply" => "users#create_applicant"

  get "/donate" => "users#donatef"
  put "/donate" => "users#create_donor"

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/user' => 'users#create_applicant'
end
