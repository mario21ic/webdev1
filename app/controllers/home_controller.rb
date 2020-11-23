class HomeController < ApplicationController
  layout "application"

  def index
    @proyectos = Proyecto.all
    @variables = Variable.all
  end

  def nosotros
  end

  def proyectos
    @proyectos = Proyecto.all
    @variables = Variable.all
  end

  def acceder
  end

  def contactenos
  end
end
