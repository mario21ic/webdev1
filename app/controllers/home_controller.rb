class HomeController < ApplicationController
  layout "application"

  def index
    @proyectos = Proyecto.all
    @variables = Variable.all
  end

  def nosotros
    @variables = Variable.all
  end

  def proyectos
    @proyectos = Proyecto.all
    @variables = Variable.all
  end

  def acceder
    @variables = Variable.all
  end

  def contactenos
    @variables = Variable.all
  end
end
