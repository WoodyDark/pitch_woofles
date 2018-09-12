Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :feedings, except: [:show]

  get 'feedings/index' => 'feedings#index'
  get '/session' => 'feedings#index'

  post 'feedings' => 'feedings#set_duration', as: 'feedings_duration'

  root 'feedings#index'

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

end
