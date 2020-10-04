class ClientesController < ApplicationController
    before_action :validate_route

    def index
        @clientes = Cliente.all
    end

    # GET /clientes/new
    def new
        @cliente = Cliente.new
    end

    def view
        @cliente = Usuario.find_by(email: params[:email])
	end

    def criar
        respond_to do |format|
            if Usuario.verificar_email(params[:email])
                usuario = Usuario.invite!(:email => params[:email], :nome => params[:nome])

                flash[:notice] =  'Convite enviado com sucesso!'
                format.js {render inline: "location.href='/clientes/view?email=#{params[:email]}'"}
            else
                flash[:notice] =  'Email já cadastrado no sistema.'
                format.js {render inline: "location.reload();" }
            end
        end
    end

    def editar
		@cliente = Usuario.find_by(email: params[:email])
	end

    def atualizar
		@cliente = Usuario.find_by(email: params[:email])
		if !params[:senha].blank?
			@cliente.update(nome: params[:nome], password: params[:senha])
		else
			@cliente.update(nome: params[:nome])
		end

    	respond_to do |format|
     		flash[:notice] =  'Cliente atualizado com sucesso!'
			format.js {render inline: "location.href='/clientes/view?email=#{params[:email]}'"}
		end
	end

    def destroy
        @usuario = Usuario.find_by(email: params[:email])

        @cliente = Cliente.find_by(usuario_id: @usuario)


        @compras = Compra.where(cliente_id: @cliente.id)

        @compras.each do |compra|
            @produtos_compras = ProdutosCompra.where(compra_id: compra.id)

            @produtos_compras.each do |produtos_compra|
                produtos_compra.destroy
            end

            compra.destroy
        end

        @cliente.destroy
        @usuario.destroy

        respond_to do |format|
        format.html { redirect_to clientes_url, notice: 'Cliente deletado com sucesso.' }
        format.json { head :no_content }
        end
    end
end
