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
            if Usuario.verificar_email(params[:email])
                usuario = Usuario.invite!(:email => params[:email], :nome => params[:nome])
                @admin = Admin.create(usuario_id: usuario.id)

                flash[:notice] =  'Convite enviado com sucesso!'
				format.js {render inline: "location.href='/admins/view?email=#{params[:email]}'"}
            else
                flash[:notice] =  'Email já cadastrado no sistema.'
                format.js {render inline: "location.reload();" }
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

        Cliente.find_by(usuario_id: @usuario).destroy
        Admin.find_by(usuario_id: @usuario).destroy

        @usuario.destroy

        respond_to do |format|
            format.html { redirect_to admins_url, notice: 'Administrador deletado com sucesso.' }
            format.json { head :no_content }
        end
    end
end
