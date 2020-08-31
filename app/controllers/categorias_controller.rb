class CategoriasController < ApplicationController
    before_action :validate_route
    before_action :set_categoria, only: [:show, :edit, :update, :destroy]

    # GET /categorias
    # GET /categorias.json
    def index
        @categorias = Categoria.all
    end

    # GET /categorias/1
    # GET /categorias/1.json
    def show
    end

    # GET /categorias/new
    def new
        @categoria = Categoria.new
    end

    # GET /categorias/1/edit
    def edit
    end

    # POST /categorias
    # POST /categorias.json
    def create
        @categoria = Categoria.new(categoria_params)

        respond_to do |format|
        if @categoria.save
            format.html { redirect_to @categoria, notice: 'Categoria cadastrada com sucesso.' }
            format.json { render :show, status: :created, location: @categoria }
        else
            format.html { render :new }
            format.json { render json: @categoria.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /categorias/1
    # PATCH/PUT /categorias/1.json
    def update
        respond_to do |format|
          if @categoria.update(categoria_params)
            format.html { redirect_to @categoria, notice: 'Categoria atualizada com sucesso.' }
            format.json { render :show, status: :ok, location: @categoria }
          else
            format.html { render :edit }
            format.json { render json: @categoria.errors, status: :unprocessable_entity }
          end
        end
    end

    # DELETE /categorias/1
    # DELETE /categorias/1.json
    def destroy
        @categoria.destroy
        respond_to do |format|
        format.html { redirect_to categorias_url, notice: 'Categoria deletada com sucesso.' }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_categoria
            @categoria = Categoria.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def categoria_params
            params.require(:categoria).permit(:nome)
        end
end
