TwitterPersonalityRecruiter::Application.routes.draw do
  match '/participants/new/:handle' => "participants#new"
  resources :participants, :only => [:create] do
    resources :informants, :only => [:new, :create]
    resources :observers, :only => [:new, :create]
  end

	root :to => "admin#index"
end
