class Solicitud < ApplicationRecord
  belongs_to :departamento, optional: true
end
