Rails.application.routes.draw do
    resources :produtos_compras
    resources :categorias_produtos

    resources :compras do
        collection do
            get 'minhas_compras'
            get 'checkout'
            get 'relatorio'
        end
    end

    resources :categorias

    resources :produtos do
        collection do
            get 'catalogo'
            get 'view'
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
        end
    end

    devise_for :usuarios

    root to: 'produtos#catalogo'
end
