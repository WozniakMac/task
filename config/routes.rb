Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  resources :teachers

  get :visitors, action: :index, controller: :visitors
  get :subjects, action: :subjects, controller: :reports

  devise_for :users
end
