json.extract! cliente, :id, :usuario_id, :cpf, :endereco, :bairro, :cidade, :estado, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
