json.extract! produtos_compra, :id, :produto_id, :compra_id, :quantidade, :created_at, :updated_at
json.url produtos_compra_url(produtos_compra, format: :json)
