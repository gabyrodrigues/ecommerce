Rails.application.routes.draw do
    resources :produtos_compras
    resources :categorias_produtos

    resources :compras do
        collection do
            get 'minhas_compras'
            get 'checkout'
            get 'relatorio'
            post 'cart_save'
            get 'buscar_diario'
            get 'buscar_cliente'
            match 'atualizar_status', via: [:get, :post]
        end
    end

    # post '/compras/cart_save', to: 'compras#cart_save'

    resources :categorias

    resources :produtos do
        collection do
            get 'catalogo'
            match 'view', via: [:get, :post]
        end
    end

    resources :clientes do
        collection do
            match 'view', via: [:get, :post]
            match 'criar', via: [:get, :post]
            match 'editar', via: [:get, :post]
            match 'atualizar', via: [:get, :post]
            match 'excluir', via: [:get, :post]
        end
    end
    resources :admins do
        collection do
            match 'view', via: [:get, :post]
            match 'criar', via: [:get, :post]
            match 'editar', via: [:get, :post]
            match 'atualizar', via: [:get, :post]
            match 'excluir', via: [:get, :post]
            get 'private_route'
        end
    end

    devise_for :usuarios

    root to: 'produtos#catalogo'
end
