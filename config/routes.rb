Chyldwelfare::Application.routes.draw do
  root :to => "user#splash"

  resources :users, :only => [:index, :new, :create]

  get "/apply" => "users#applyf"
  put "/apply" => "users#create_applicant"

  get "/donate" => "users#donatef"
  put "/donate" => "users#create_donnor"

end
