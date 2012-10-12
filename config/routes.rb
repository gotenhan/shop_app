ShopApp::Application.routes.draw do
  root to: 'shop#index'

  resources :phones
end
