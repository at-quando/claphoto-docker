Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :viewers
  resources :home
  resources :messages, only: [:create]
  resources :contracts
  resources :prices
  resources :cloths
  resources :accessories
  resources :google, only: [:index, :create]
  resources :photographers, only: [:index, :show, :update, :edit]
  resources :contract_photographers, only: [:edit]
  resources :signatures, only: [:index, :create]
  resources :schedule, only: [:index]
  resources :raws, only: [:show, :create, :index]

  scope '/api' do
    resources :videos, only: [:show, :index]
    get '/viewers/:id' => 'viewers#showMobile', :as => :show_viewers_mobile
    get '/hotcostume' => 'articles#hot_costume', :as => :hot_costume
    get 'index_costume' => 'articles#index_costume', :as => :index_costume
    get 'index_concept' => 'articles#index_concept', :as => :index_concept
    get 'index_posing' => 'articles#index_posing', :as => :index_posing
    get 'index_price' => 'prices#index', :as => :index_price
  end

  put 'photographers/:id/payall' => 'photographers#payall', :as => :payall_photo
  get 'checkapi' => 'home#checkapi', :as => :checkapi
  get '/articles/:id/:title' => 'articles#show', :as => :article_with_title
  get '/posing' => 'articles#index', :as => :article_posing
  get '/concept' => 'articles#index', :as => :article_concept
  get '/clothes' => 'articles#index', :as => :article_clothes
  get '/ask' => 'articles#index', :as => :article_ask
  get '/scription/:id' => 'contracts#scription', :as => :contract_scription
  post '/raws/:id/submit' => 'raws#submit', :as => 'submit_raws'
  post "/upload_image" => "upload#upload_image", :as => :upload_image
  get "/download_file/:name" => "upload#access_file", :as => :access_file, :name => /.*/

  get "/" => redirect("/home")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
