Rails.application.routes.draw do
  post 'admin/stories/' => 'stories#create', :as => :story_create
  devise_for :stories, ActiveAdmin::Devise.config
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
    resources :stories, only: [:show, :index]
    get '/viewers/:id' => 'viewers#showMobile', :as => :show_viewers_mobile
    get '/hotcostume' => 'articles#hot_costume', :as => :hot_costume
    get 'index_article' => 'articles#index_article', :as => :index_article
    get 'index_price' => 'prices#index', :as => :index_price
    get 'show_detail/:id' => 'articles#show', :as => :show_detail
    get 'show_rand_detail' => 'articles#show_rand', :as => :show_detail_rand
    get 'show_related_detail' => 'articles#show_related', :as => :show_detail_related
    get 'get_products' => 'articles#show_product', :as => :show_product
    get 'get_main_article' => 'articles#show_main_article', :as => :show_main_article
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
