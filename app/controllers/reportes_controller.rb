class ReportesController < ApplicationController
  layout "panel"

  def index
    @departamentos = Departamento.all
  end
end