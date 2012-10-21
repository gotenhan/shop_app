ShopApp::Application.routes.draw do
  root to: 'shop#index'

  constraints id: '\d+' do
    resources :phones, only: [:index, :show]
    resources :categories, only: [:index, :show]

    namespace :admin do
      root to: 'phones#index'
      resources :phones
      resources :categories
    end
  end
end
