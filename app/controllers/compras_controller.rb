class ComprasController < ApplicationController
    before_action :validate_route, only: [:index, :edit, :new]
    before_action :set_compra, only: [:show, :edit, :update, :destroy]

    # GET /compras
    # GET /compras.json
    def index
        @compras = Compra.all
    end

    def minhas_compras
        cliente = Cliente.find_by(usuario_id: current_usuario.id)
        @compras = Compra.where(cliente_id: cliente.id).order(data: :desc)
    end

    def cart_save
        produtos_string = request.raw_post
        produtos_json = JSON.parse(produtos_string)

        cliente = Cliente.find_by(usuario_id: current_usuario.id)

        co = ComprasProdutosCliente.where(cliente_id: cliente.id)
        co.delete_all if !produtos_json.blank?

        produtos_json.each do |produto_ind|
            produto = Produto.find(produto_ind.select{ |k,val| k == 'produto' }.values.first)
            qtde = produto_ind.select{ |k,val| k == 'qtde' }.values.first
            compra_produto_cliente = ComprasProdutosCliente.new cliente_id: cliente.id, produto_id: produto.id, quantidade: qtde
            compra_produto_cliente.save
        end
    end

    def checkout
        @compra = Compra.new
        @produtos = get_produtos
    end

    def relatorio
    end

    # GET /compras/1
    # GET /compras/1.json
    def show
        @produtos_compras = ProdutosCompra.where(compra_id: params[:id])
    end

    # GET /compras/new
    def new
        @compra = Compra.new
    end

    # GET /compras/1/edit
    def edit
    end

    # POST /compras
    # POST /compras.json
    def create
        @produtos = get_produtos

        @compra = Compra.new(compra_params)
        @compra.data = Date.today
        @compra.hora = Time.now.strftime("%H:%M:%S")
        @compra.valor_total = params[:compra][:valor_total].to_f
        @compra.status = "Solicitado"

        respond_to do |format|
        if @compra.save
            @produtos.each do |produto|
                ProdutosCompra.create(compra_id: @compra.id, produto_id: produto[:produto][:id], quantidade: produto[:quantidade])
            end
            format.html { redirect_to @compra, notice: 'Compra efetuada com sucesso.' }
            format.json { render :show, status: :created, location: @compra }
        else
            format.html { render :new }
            format.json { render json: @compra.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /compras/1
    # PATCH/PUT /compras/1.json
    def update
        # respond_to do |format|
        #   if @compra.update(compra_params)
        #     format.html { redirect_to @compra, notice: 'Compra was successfully updated.' }
        #     format.json { render :show, status: :ok, location: @compra }
        #   else
        #     format.html { render :edit }
        #     format.json { render json: @compra.errors, status: :unprocessable_entity }
        #   end
        # end
    end

    # DELETE /compras/1
    # DELETE /compras/1.json
    def destroy
        @compra.destroy
        respond_to do |format|
        format.html { redirect_to compras_url, notice: 'Compra was successfully destroyed.' }
        format.json { head :no_content }
        end
    end

    private
    def get_produtos
        cliente = Cliente.find_by(usuario_id: current_usuario.id)

        prod = ComprasProdutosCliente.where(cliente_id: cliente.id).pluck(:produto_id, :quantidade)
        @produtos = []

        prod.each do |produto, qtd|
            @produtos.push({produto: Produto.find(produto), quantidade: qtd })
        end

        return @produtos
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
        @compra = Compra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compra_params
        params.require(:compra).permit(:cliente_id, :data, :hora, :cep, :endereco, :bairro, :cidade, :estado, :forma_pagamento, :valor_total, :numero_cartao, :cvv, :data_validade, :status)
    end
end
