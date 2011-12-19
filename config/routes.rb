TwitterPersonalityRecruiter::Application.routes.draw do
  match '/new_participant/:handle' => "participants#new"
  resources :participants, :only => [:new, :create, :edit, :update] do
    resources :informants, :only => [:show, :edit, :update]
  end
  
  resources :observers, :except => [:destroy] do
    resources :participant_ten_items, :only => [:new, :create]
  end

  get "thank_you/index"

	root :to => "thank_you#index"
end
