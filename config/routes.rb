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
  get "public/home/about" => "public/homes#about" ,as: "about"

  namespace :admin do
    root to: 'homes#top'
    resources :members, only: [:index, :show, :edit, :update]
    resources :genres, only:[:index,:create,:edit,:update,:destroy,:show]
    resources :projects
    resources :requests
    resources :request_projects
end

 namespace :public do
    put "/members/:id/hide" => "members#hide", as: 'members_hide'
    get '/search', to: 'searchs#search'
    get "/members/:id/withdrawal" => "members#withdrawal", as: 'members_withdrawal'
    post "/members/request_confirm" => "requests#request_confirm", as: 'request_confirm'
    get  "/members/complete" => "requests#complete", as: 'complete'
    root to: "homes#top"
    resources :homes
    delete 'cart_projects/all_destroy' => 'cart_projects#all_destroy'
    resources :cart_projects, only:[:index, :create, :update, :destroy]
    resources :members
    resources :projects
    resources :requests
    resources :receiveds
    resources :events
    root "events#index"
  end

end


