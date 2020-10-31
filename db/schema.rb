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

ActiveRecord::Schema.define(version: 2020_10_30_023346) do

  create_table "departamentos", force: :cascade do |t|
    t.integer "cod_departamento"
    t.integer "cod_proyecto"
    t.integer "numero"
    t.integer "piso"
    t.decimal "area_total"
    t.decimal "area_techada"
    t.decimal "dormitorios"
    t.decimal "baños"
    t.string "mca_favorito"
    t.string "descripcion_corta"
    t.string "descripcion_larga"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proyectos", force: :cascade do |t|
    t.integer "cod_proyecto"
    t.string "nombre"
    t.string "ubicacion"
    t.string "descripcion_corta"
    t.string "descripcion_larga"
    t.decimal "precio_m2"
    t.string "mca_favorito"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
