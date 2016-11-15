Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  get :visitors, action: :index, controller: :visitors

  devise_for :users
end
