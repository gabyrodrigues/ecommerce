# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

@usuario = Usuario.create! :nome => 'Administrador', :email => 'cosmicos2018@gmail.com', :password => '123456', :password_confirmation => '123456'
@admin = Admin.create! :usuario_id => @usuario.id
