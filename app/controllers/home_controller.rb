class HomeController < ApplicationController
  before_action :init
  layout "application"

  def index
    @proyectos = Proyecto.where("estado!='I' AND mca_favorito = 'S'")
    @departamentos = Departamento.where("estado!='I'")
    @archivos = Archivo.where("estado!='I'")
  end

  def nosotros
  end

  def proyectos
  end

  def acceder
  end

  def contactenos
  end

  private
    def init
      @variables = Variable.where(estado:'A')
    end
end
