class ProformaUpdateColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :proformas, :solicitud, foreign_key: true
  end
end
