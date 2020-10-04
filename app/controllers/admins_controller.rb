class AdminsController < ApplicationController
    before_action :validate_route, only: [:index, :editar, :view, :new]

    def index
        @admins = Admin.all
    end

    # GET /admins/new
    def new
        @admin = Admin.new
    end

    def view
        @admin = Usuario.find_by(email: params[:email])
	end

    def criar
        respond_to do |format|
            if !Usuario.verificar_email(params[:email])
                flash[:notice] =  'Email já cadastrado no sistema.'
                format.js {render inline: "location.reload();" }
            else
                usuario = Usuario.invite!(:email => params[:email], :nome => params[:nome])
                @admin = Admin.create(usuario_id: usuario.id)

                flash[:notice] =  'Convite enviado com sucesso!'
				format.js {render inline: "location.href='/admins/view?email=#{params[:email]}'"}
            end
        end
    end

    def editar
		@admin = Usuario.find_by(email: params[:email])
	end

    def atualizar
		@admin = Usuario.find_by(email: params[:email])
		if !params[:senha].blank?
			@admin.update(nome: params[:nome], password: params[:senha])
		else
			@admin.update(nome: params[:nome])
		end

    	respond_to do |format|
     		flash[:notice] =  'Admin atualizado com sucesso!'
			format.js {render inline: "location.href='/admins/view?email=#{params[:email]}'"}
		end
	end

    def destroy
        @usuario = Usuario.find_by(email: params[:email])
        @admin = Admin.find_by(usuario_id: @usuario.id)

        @compras = Compra.where(cliente_id: admin.id)

        @compras_produtos_clientes = ComprasProdutosCliente.where(cliente_id: admin.id)

        @compras_produtos_clientes.each do |compras_produtos_cliente|
            compras_produtos_cliente.destroy
        end

        @compras.each do |compra|
            @produtos_compras = ProdutosCompra.where(compra_id: compra.id)

            @produtos_compras.each do |produtos_compra|
                produtos_compra.destroy
            end

            compra.destroy
        end

        Cliente.find_by(usuario_id: @usuario).destroy
        @admin.destroy

        @usuario.destroy

        respond_to do |format|
            format.html { redirect_to admins_url, notice: 'Administrador deletado com sucesso.' }
            format.json { head :no_content }
        end
    end
end
