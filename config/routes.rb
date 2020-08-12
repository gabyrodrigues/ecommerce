Rails.application.routes.draw do
  resources :produtos_compras
  resources :categorias_produtos
  resources :compras
  resources :categorias
  resources :produtos do
    collection do
      get 'catalogo'
    end
  end

  resources :clientes
  resources :admins

  devise_for :usuarios

  root to: 'produtos#catalogo'
end
