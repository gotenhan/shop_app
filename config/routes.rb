ShopApp::Application.routes.draw do
  devise_for :admin_users

  root to: 'shop#index'

  constraints id: '\d+' do
    resources :phones, only: [:index, :show]
    resources :categories, only: [:index, :show]

    match '/cart/' => 'cart#list', via: 'get', as: 'cart'
    match '/cart/add_phone/:id' => 'cart#add', via: 'put', as: 'add_phone_to_cart'
    match '/cart/remove_phone/:id' => 'cart#remove', via: 'put', as: 'remove_phone_from_cart'
    match '/cart/confirm' => 'cart#confirm', via: 'put', as: 'confirm_order'

    namespace :admin do
      root to: 'admin#admin', as: 'admin'
      resources :phones
      resources :categories
      resources :buyers, only: [:index, :show, :destroy]
      resources :orders, only: [:index, :show, :destroy]
    end
  end
end
