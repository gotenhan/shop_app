ShopApp::Application.routes.draw do
  root to: 'shop#index'

  constraints id: '\d+' do
    resources :phones, only: [:index, :show]
    resources :categories, only: [:index, :show]
  end
end
