Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  authenticate :user do
    resources :bu_selections, only: %i[index] do
      collection do
      post :add_to_cart, to: "bu_selections#add_to_cart", as: "add_to_cart"
      delete :delete_to_cart, to:  "bu_selections#delete_to_cart", as: "delete_to_cart"
      post :finalize_cart, to: "bu_selections#finalize_cart", as: "finalize_cart"
      end
    end
      resources :profile_associates, only: %i[index new create] do
        collection do
         get "select_profile"
          # get "data_vaccines/:id", to: "data_vaccines#index"
          post "data_vaccines", to: "data_vaccines#index"
          post "associate"
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # A FAZER
  # Rota de endereço ANTES de encaminhar para a escolha de vacina ou exame (Controller e view)
  #  authenticate :users, :bu_selections do  resources :sche_daily, only: [ ;index, :show, :new ...]  end
  #  Presença da tela de gerenciamento de dependentes.

  # Defines the root path route ("/")
  # root "posts#index"
end
