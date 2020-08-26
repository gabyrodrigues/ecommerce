class AdminsController < ApplicationController
    skip_before_action :authenticate_usuario!
    before_action :set_admin, only: [:show, :edit, :update, :destroy]

    # GET /admins
    # GET /admins.json
    def index
        @admins = Admin.all
    end

    # GET /admins/1
    # GET /admins/1.json
    def show
    end

    # GET /admins/new
    def new
        @admin = Admin.new
    end

    # GET /admins/1/edit
    def edit
    end

    def view
        @admin = Usuario.find_by(email: params[:email])
	end

    # POST /admins
    # POST /admins.json
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

    # PATCH/PUT /admins/1
    # PATCH/PUT /admins/1.json
    def update
        respond_to do |format|
            if @admin.update(admin_params)
                format.html { redirect_to @admin, notice: 'Administrador atualizado com sucesso.' }
                format.json { render :show, status: :ok, location: @admin }
            else
                format.html { render :edit }
                format.json { render json: @admin.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /admins/1
    # DELETE /admins/1.json
    def destroy
        @admin.destroy
        respond_to do |format|
            format.html { redirect_to admins_url, notice: 'Administrador deletado com sucesso.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
        @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
        params.require(:admin).permit(:usuario_id)
    end
end
