Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :feedings, except: [:show, :index]

  get 'control_room/index' => 'control_room#index'

  root 'control_room#index'

end
