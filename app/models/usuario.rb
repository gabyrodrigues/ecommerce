class Usuario < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    validates_presence_of :nome

    def self.verificar_email(email)
        return self.where(email: email).blank?
    end

    after_create :insert_cliente
    before_destroy :delete_user

    def insert_cliente
        Cliente.create(usuario_id: self.id)
    end

    def delete_user
        cliente = Cliente.find_by(usuario_id: self.id)
        admin = Admin.find_by(usuario_id: self.id)

        if (cliente)
            cliente.destroy
        end

        if (admin)
            admin.destroy
        end
    end
end
