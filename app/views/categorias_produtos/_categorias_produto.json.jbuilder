json.extract! categorias_produto, :id, :categoria_id, :produto_id, :created_at, :updated_at
json.url categorias_produto_url(categorias_produto, format: :json)
