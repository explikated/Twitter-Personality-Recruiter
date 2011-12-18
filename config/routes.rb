TwitterPersonalityRecruiter::Application.routes.draw do
  match '/participants/new/:handle' => "participants#new"
  resources :participants, :except => [:destroy, :new, :create] do
    resources :informants, :except => [:create, :destroy]
    resources :observers, :except => [:create, :destroy]
  end

  get "thank_you/index"

	root :to => "thank_you#index"
end
