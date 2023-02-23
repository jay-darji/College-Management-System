Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :student_academic_informations
  resources :parental_informations
  resources :addresses
  resources :courses
  resources :password, only: [:edit, :update]
  resources :faculty_academic_informations
  root "sessions#new"

  get "sign_up", to: "users#new", as: "sign_up"
  #post '/signin/new', to: "signin#create"
  #get '/login', to: "sessions#new", as: '/login'
  #post '/login', to: "sessions#create", as: '/login'
  #get "signup", to: "users#sign_up"
  #post "signup", to: "users#sign_up"
  get "sign_in", to: "sessions#new", as:"sign_in"
  post "sign_in", to: "sessions#create"
  get "college_info", to:"student_academic_informations#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "add_parents_details", to:"parental_informations#new"
  get "add_address_details", to:"addresses#new"
  delete "sign_out", to: "sessions#destroy"
  get "sign_out", to: "sessions#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
  # get "/password_update/:id", to:"users#passwordUpdate", as:"edit_password"
  # patch "password_update", to:"users#passwordUpdate"
end
