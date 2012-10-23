ShopApp::Application.routes.draw do
  devise_for :admin_users

  root to: 'shop#index'

  constraints id: '\d+' do
    resources :phones, only: [:index, :show]
    resources :categories, only: [:index, :show]

    namespace :admin do
      root to: 'admin#admin', as: 'admin'
      resources :phones
      resources :categories
      resources :buyers, only: [:index, :show, :destroy]
      resources :orders, only: [:index, :show, :destroy]
    end
  end
end
