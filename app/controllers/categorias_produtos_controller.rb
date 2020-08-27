class CategoriasProdutosController < ApplicationController
    before_action :validate_route
    before_action :set_categorias_produto, only: [:show, :edit, :update, :destroy]

    # GET /categorias_produtos
    # GET /categorias_produtos.json
    def index
        @categorias_produtos = CategoriasProduto.all
    end

    # GET /categorias_produtos/1
    # GET /categorias_produtos/1.json
    def show
    end

    # GET /categorias_produtos/new
    def new
        @categorias_produto = CategoriasProduto.new
    end

    # GET /categorias_produtos/1/edit
    def edit
    end

    # POST /categorias_produtos
    # POST /categorias_produtos.json
    def create
        @categorias_produto = CategoriasProduto.new(categorias_produto_params)

        respond_to do |format|
        if @categorias_produto.save
            format.html { redirect_to @categorias_produto, notice: 'Categorias produto was successfully created.' }
            format.json { render :show, status: :created, location: @categorias_produto }
        else
            format.html { render :new }
            format.json { render json: @categorias_produto.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /categorias_produtos/1
    # PATCH/PUT /categorias_produtos/1.json
    def update
        # respond_to do |format|
        #   if @categorias_produto.update(categorias_produto_params)
        #     format.html { redirect_to @categorias_produto, notice: 'Categorias produto was successfully updated.' }
        #     format.json { render :show, status: :ok, location: @categorias_produto }
        #   else
        #     format.html { render :edit }
        #     format.json { render json: @categorias_produto.errors, status: :unprocessable_entity }
        #   end
        # end
    end

    # DELETE /categorias_produtos/1
    # DELETE /categorias_produtos/1.json
    def destroy
        @categorias_produto.destroy
        respond_to do |format|
        format.html { redirect_to categorias_produtos_url, notice: 'Categorias produto was successfully destroyed.' }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_categorias_produto
        #@categorias_produto = CategoriasProduto.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def categorias_produto_params
        params.require(:categorias_produto).permit(:categoria_id, :produto_id)
        end
end
