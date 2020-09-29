# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_29_001918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usuario_id"], name: "index_admins_on_usuario_id"
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorias_produtos", force: :cascade do |t|
    t.bigint "categoria_id", null: false
    t.bigint "produto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categoria_id"], name: "index_categorias_produtos_on_categoria_id"
    t.index ["produto_id"], name: "index_categorias_produtos_on_produto_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usuario_id"], name: "index_clientes_on_usuario_id"
  end

  create_table "compras", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.datetime "data_hora"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cep"
    t.string "endereco"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "forma_pagamento"
    t.decimal "valor_total"
    t.string "numero_cartao"
    t.integer "cvv"
    t.string "data_validade"
    t.string "status"
    t.index ["cliente_id"], name: "index_compras_on_cliente_id"
  end

  create_table "compras_produtos_clientes", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "produto_id", null: false
    t.integer "quantidade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_compras_produtos_clientes_on_cliente_id"
    t.index ["produto_id"], name: "index_compras_produtos_clientes_on_produto_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.float "preco"
    t.integer "quantidade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "produtos_compras", force: :cascade do |t|
    t.bigint "produto_id", null: false
    t.bigint "compra_id", null: false
    t.integer "quantidade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["compra_id"], name: "index_produtos_compras_on_compra_id"
    t.index ["produto_id"], name: "index_produtos_compras_on_produto_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["invitation_token"], name: "index_usuarios_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_usuarios_on_invitations_count"
    t.index ["invited_by_id"], name: "index_usuarios_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_usuarios_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admins", "usuarios"
  add_foreign_key "categorias_produtos", "categorias"
  add_foreign_key "categorias_produtos", "produtos"
  add_foreign_key "clientes", "usuarios"
  add_foreign_key "compras", "clientes"
  add_foreign_key "compras_produtos_clientes", "clientes"
  add_foreign_key "compras_produtos_clientes", "produtos"
  add_foreign_key "produtos_compras", "compras"
  add_foreign_key "produtos_compras", "produtos"
end
