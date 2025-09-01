Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  authenticate :user do
    resources :bu_selections, only: %i[index show new destroy] do
      resources :profile_associates, only: %i[index show new destroy] do
        get "data_vaccines/:id", to: "data_vaccines#index"
       # resources :data_vaccines, only: %i[index new]
     end
    end
  end # Fluxo aninhado de rotas

  get "up" => "rails/health#show", as: :rails_health_check




  # A FAZER
  # Rota de endereço ANTES de encaminhar para a escolha de vacina ou exame (Controller e view)
  #  authenticate :users, :bu_selections do  resources :sche_daily, only: [ ;index, :show, :new ...]  end
  #  Presença da tela de gerenciamento de dependentes.

  # Defines the root path route ("/")
  # root "posts#index"
end
