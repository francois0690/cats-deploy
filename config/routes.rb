# == Route Map
#

Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'pages#home'

# page de test
    get 'test', to: 'pages#test', as: 'test'

  unauthenticated do
    # root to: 'pages#home'
    root to: 'animals#index'
    get 'dropdown', to: 'animals#dropdown'


  end

  authenticated do
    root to: 'animals#index', as: :authenticated_root
    # root to: 'pages#home', as: :authenticated_root

    resources :animals, except: [ :show] do
      resource :favorites, only: [ :create ]
    end
    resources :favorites, only: [ :destroy ]


    # 3 routes pour la dropdown dynamique de la race (utilisation de fetch en JS)
    # route pour new
    get 'animals/dropdown', to: 'animals#dropdown'#, as: "dropdown"
    # animals_dropdown GET    /animals/dropdown(.:format)                       animals#dropdown
    #route pour edit, ca utilise la meme methode du controlleur mais au moins la route existe pour le fetch
    get 'animals/:id/dropdown', to: 'animals#dropdown'#, as: "dropdown"

    #route pour new ou edit mais avec des erreurs de validation
    get 'dropdown', to: 'animals#dropdown'#, as: "dropdown"


    #supprime une photo de l'animal
    # patch 'delete_photo', to: 'animals#delete_photo', as: :delete_photo


    #supprime une photo de l'animal v2
    get 'add_photo_to_delete', to: 'animals#add_photo_to_delete', as: :add_photo_to_delete

    #supprime un pdf dans le theme form
    # get 'add_pdf_to_delete', to: 'themes#add_pdf_to_delete', as: :add_pdf_to_delete






    # get 'dropdown', to: 'animals#dropdown' as: "dropdown" =====> ya pas de controlleur dropdown dans l'url ca ne peut pas marcher
    # dropdown GET    /dropdown(.:format)                                       animals#dropdown


    # le       resources :favorites, only: [ :create ]
    # donne pour le create
    # cat_favorites POST   /cats/:cat_id/favorites(.:format)                     favorites#create
    # ==> coup de bol car le create n'a pas d'ID

    # le       resource :favorites, only: [ :create ]
    # donne pour le create
    # cat_favorites POST   /cats/:cat_id/favorites(.:format)                     favorites#create
    # ==> ca donne la même chose mais d'ID forcé avec le resource

    # get 'favoris', to: 'pages#favorites', as: 'favoris'

    # lien mes favoris dans la navbar
    get 'favoris', to: 'animals#favorites', as: 'favoris'


    resources :themes, except: [ :show ] do
      resource :configs , only: [ :update ]
      # resources :configs , shallow: true
    end

    # dans un bloc resources :themes, except: [ :show ] do
    #    resource :configs, only: [ :update ]
    #    donne
    #    theme_configs PATCH  /themes/:theme_id/configs(.:format)                   configs#update
    #                  PUT    /themes/:theme_id/configs(.:format)                   configs#update


    #    resources :configs, only: [ :update ]
    #    donne
    #    theme_config PATCH  /themes/:theme_id/configs/:id(.:format)                configs#update
    #                 PUT    /themes/:theme_id/configs/:id(.:format)                configs#update


  end

  # show le profil
  get 'profil', to: 'users#profil', as: 'profil'

  #patch le profil
  patch 'profil/users_id', to: 'users#update_profil', as: :update_profil



end
