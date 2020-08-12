class ProdutosComprasController < ApplicationController
  before_action :set_produtos_compra, only: [:show, :edit, :update, :destroy]

  # GET /produtos_compras
  # GET /produtos_compras.json
  def index
    @produtos_compras = ProdutosCompra.all
  end

  # GET /produtos_compras/1
  # GET /produtos_compras/1.json
  def show
  end

  # GET /produtos_compras/new
  def new
    @produtos_compra = ProdutosCompra.new
  end

  # GET /produtos_compras/1/edit
  def edit
  end

  # POST /produtos_compras
  # POST /produtos_compras.json
  def create
    @produtos_compra = ProdutosCompra.new(produtos_compra_params)

    respond_to do |format|
      if @produtos_compra.save
        format.html { redirect_to @produtos_compra, notice: 'Produtos compra was successfully created.' }
        format.json { render :show, status: :created, location: @produtos_compra }
      else
        format.html { render :new }
        format.json { render json: @produtos_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos_compras/1
  # PATCH/PUT /produtos_compras/1.json
  def update
    respond_to do |format|
      if @produtos_compra.update(produtos_compra_params)
        format.html { redirect_to @produtos_compra, notice: 'Produtos compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @produtos_compra }
      else
        format.html { render :edit }
        format.json { render json: @produtos_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos_compras/1
  # DELETE /produtos_compras/1.json
  def destroy
    @produtos_compra.destroy
    respond_to do |format|
      format.html { redirect_to produtos_compras_url, notice: 'Produtos compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produtos_compra
      @produtos_compra = ProdutosCompra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produtos_compra_params
      params.require(:produtos_compra).permit(:produto_id, :compra_id, :quantidade)
    end
end
