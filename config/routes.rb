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
      get :prospective_student
      patch :filter_student
      get :application
    end

    member do
      patch :activate
      patch :add_criteria
      get :reload
    end
  end

  resources :course do
    member do
      get :detail
    end

    resources :unit do
      collection do
        get :course_units
        get :search
      end
    end
  end

  resources :application_progress do
    member do
      patch :transition
    end
  end


  resources :student do
    member do
      patch :add_academic
      get :reload
      get :recommendation
      get :application
    end
  end

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
    member do
      post :invite
    end
  end

  resource :subjects
  resources :chats, only: [:index]
  mount ActionCable.server => '/cable'

  resources :paypals do
    collection do
      post :start_payment
      get :verify_payment
    end
  end

  get 'paypal_confirm', to: 'paypals#verify_payment'

end