class Usuario < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    validates_presence_of :nome

    after_create :insert_cliente

    def insert_cliente
        Cliente.create(usuario_id: self.id)
    end
end
