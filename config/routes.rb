Rails.application.routes.draw do
  devise_for :admins,:controllers => {
      :registrations => 'admins/registrations',
      :passwords => 'admins/passwords',
      :sessions => 'admins/sessions'
    }
  devise_for :members,:controllers => {
     :registrations => 'members/registrations',
     :passwords => 'members/passwords',
     :sessions => 'members/sessions'
   }
  root to: "public/homes#top"
  get "public/home/about" => "public/homes#about"
  
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :projects, only: [:index, :show, :new, :create, :edit, :update]
    resources :requests, only: [:show, :update] do
      resources :request_datails, only: [:update]
    end
end

scope module: :public do
    root to: "public/homes#top", as: "top"
    get "public/home/about" => "public/homes#about" ,as: "about"
    resources :projects, only: [:index, :show]
    delete 'cart_projects/destroy_all' => 'cart_products#destroy_all'
    resources :cart_products, only: [:index, :create, :update, :destroy ]
    delete 'cart_products/:id' => 'cart_products#destroy', as: 'destroy_cart_project'
    resources :requests, only: [:index, :show, :create, :new] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :customers, only: [:show, :edit, :update] do
      member do
        get :quit_confirm
        patch :quit
      end
    end

    end
end


