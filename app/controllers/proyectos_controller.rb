class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  layout "application"

  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.all
    @variables = Variable.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
    @departamentos = Departamento.all
    @variables = Variable.all
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
    @variables = Variable.all
  end

  # GET /proyectos/1/edit
  def edit
    @variables = Variable.all
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyecto_params
      params.require(:proyecto).permit(:cod_proyecto, :nombre, :ubicacion, :descripcion_corta, :descripcion_larga, :precio_m2, :mca_favorito, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :departamento, :provincia, :distrito, :latitud, :longitud)
    end
end
