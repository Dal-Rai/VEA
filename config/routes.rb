Rails.application.routes.draw do

  devise_for :users, :controllers => {
    passwords: 'passwords',
    registrations: 'registrations',
    invitations: 'invitations',
    sessions: 'sessions'
  }

  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount ActionCable.server => '/cable'

  resources :university do
    resources :faculty
    collection do
      get :valid_token
      get :search
    end

    member do
      patch :activate
    end
  end

  resources :course do
    resources :unit do
      collection do
        get :course_units
        get :search
      end
    end
  end

  resources :student
  resources :courses_unit, only: [:create, :destroy]
  resources :uni_admin
  resources :users_invitations do
    collection do
      get :valid_token
    end

    member do
      put :accept_invitation
    end
  end

  resources :search_engine do
    collection do
      get :search_unit
      get :item_detail
    end
  end


  resources :users do
    collection do
      get :students
      get :universities
    end
  end

  get 'js/widget.js' => 'ticketings#widget', defaults: {format: 'js'}

end