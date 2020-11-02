class HomeController < ApplicationController
  layout "application"

  def index
    @proyectos = Proyecto.all
  end

  def nosotros
  end

  def proyectos
    @proyectos = Proyecto.all
  end

  def acceder
  end

  def contactenos
  end
end
