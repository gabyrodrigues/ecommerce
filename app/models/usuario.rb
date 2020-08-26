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

    def insert_cliente
        Cliente.create(usuario_id: self.id)
    end
end
