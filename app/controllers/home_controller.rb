class HomeController < ApplicationController
  layout "application"

  def index
    @proyectos = Proyecto.all
  end

  def nosotros
  end

  def acceder
  end

  def contactenos
  end
end
