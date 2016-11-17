Rails.application.routes.draw do
  resources :payments, except: :new
  get '/payments/new/:student_id', action: :new, controller: :payments, as: :new_payment
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
