class ReportesController < ApplicationController
  layout "application"

  def index
    @departamentos = Departamento.all
    @variables = Variable.all
  end
end
