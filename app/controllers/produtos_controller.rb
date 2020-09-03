class ProdutosController < ApplicationController
    skip_before_action :authenticate_usuario!, only: [:catalogo, :view]
    before_action :validate_route, except: [:catalogo, :view]
    before_action :set_produto, only: [:show, :edit, :update, :destroy]

    # GET /produtos
    # GET /produtos.json
    def index
        @produtos = Produto.all
    end

    def catalogo
    end

    def view
    end

    # GET /produtos/1
    # GET /produtos/1.json
    def show
        @categorias_produtos = CategoriasProduto.where(produto_id: @produto.id)
    end

    # GET /produtos/new
    def new
        @produto = Produto.new

        @categorias = Categoria.all
    end

    # GET /produtos/1/edit
    def edit
        @categorias = Categoria.all
    end

    # POST /produtos
    # POST /produtos.json
    def create
        @categorias = Categoria.where(id: params[:produto][:categoria])
        @produto = Produto.new(produto_params)

        if !@categorias.empty?
            respond_to do |format|
                if @produto.save
                    @categorias.each do |categoria|
                        CategoriasProduto.create(categoria_id: categoria.id, produto_id: @produto.id)
                    end

                    format.html { redirect_to @produto, notice: 'Produto cadastrado com sucesso.' }
                    format.json { render :show, status: :created, location: @produto }
                else
                    format.html { render :new }
                    format.json { render json: @produto.errors, status: :unprocessable_entity }
                end

            end
        else
            flash[:notice] =  'Selecione pelo menos uma categoria!'
            redirect_to new_produto_path
        end

    end

    # PATCH/PUT /produtos/1
    # PATCH/PUT /produtos/1.json
    def update
        @categorias = Categoria.where(id: params[:produto][:categoria])

        if !@categorias.empty?
            respond_to do |format|
                if @produto.update(produto_params)
                    @categorias.each do |categoria|
                        CategoriasProduto.update(categoria_id: categoria.id, produto_id: @produto.id)
                    end

                    format.html { redirect_to @produto, notice: 'Produto atualizado com sucesso.' }
                    format.json { render :show, status: :ok, location: @produto }
                else
                    format.html { render :edit }
                    format.json { render json: @produto.errors, status: :unprocessable_entity }
                end
            end
        else
            flash[:notice] =  'Selecione pelo menos uma categoria!'
            redirect_to edit_produto_path
        end
    end

    # DELETE /produtos/1
    # DELETE /produtos/1.json
    def destroy
        @categorias_produtos = CategoriasProduto.where(produto_id: @produto.id)

        @categorias_produtos.each do |categoria_produto|
            categoria_produto.destroy
        end

        @produto.destroy

        respond_to do |format|
        format.html { redirect_to produtos_url, notice: 'Produto deletado com sucesso.' }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_produto
            @produto = Produto.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def produto_params
            params.require(:produto).permit(:nome, :preco, :quantidade, :foto)
        end
end
