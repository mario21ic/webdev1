class CreatePersonas < ActiveRecord::Migration[6.0]
  def change
    create_table :personas do |t|
      t.string :tipo_documento
      t.string :numero_documento
      t.string :nombres
      t.string :apellidos
      t.string :correo
      t.string :telefono
      t.string :mca_juridico
      t.string :sexo
      t.string :fecha_aniversario
      t.string :date
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
