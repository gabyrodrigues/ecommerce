Rails.application.routes.draw do
    resources :produtos_compras
    resources :categorias_produtos

    resources :compras do
        collection do
            get 'minhas_compras'
            get 'checkout'
        end
    end

    resources :categorias

    resources :produtos do
        collection do
            get 'catalogo'
            get 'view'
        end
    end

    resources :clientes
    resources :admins

    devise_for :usuarios

    root to: 'produtos#catalogo'
end
