Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  get 'report/subjects', action: :subjects, controller: :reports
  get :visitors, action: :index, controller: :visitors

  resources :teachers do
    get :subjects
  end
  devise_for :users

  root action: :index, controller: :visitors
end
