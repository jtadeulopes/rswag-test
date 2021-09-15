Rails.application.routes.draw do
  resources :parkings
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :parkings, only: [:create] do
    member do
      put :pay
    end
  end
end
