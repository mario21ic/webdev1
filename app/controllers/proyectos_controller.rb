class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy, :home]
  before_action :init, only: [:show,:index, :home]

  layout "application"

  # GET /proyectos
  # GET /proyectos.json
  def index
    @departamentos = Departamento.where(estado: 'A')
    @archivos = Archivo.where(estado: 'A')
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
    @archivos = Archivo.where(estado: 'A')
    @departamentos = Departamento.where(cod_proyecto: params[:id])
    @caracteristicas_proyecto = CaracteristicasProyecto.where(cod_proyecto: params[:id],estado: 'A')
  end

  # GET /proyectos/1/home
  def home
    @home = 'S'
    show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
    @variables = Variable.where(estado: 'A')
  end

  # GET /proyectos/1/edit
  def edit
    @variables = Variable.where(estado: 'A')
    @caracteristicas_proyecto = CaracteristicasProyecto.where(cod_proyecto: params[:id],estado: 'A')
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        
        if params[:proyecto][:caracteristicas]
          params[:proyecto][:caracteristicas].each do |key,value|
            CaracteristicasProyecto.create(cod_proyecto:@proyecto.id, cod_caracteristica: key, estado: 'A', usu_crea: nil, fec_crea: nil)
          end
        end

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

        cc = []
        if params[:proyecto][:caracteristicas]
          params[:proyecto][:caracteristicas].each do |key,value|
                cc.push(key)
          end
        end

        CaracteristicasProyecto.where(cod_proyecto: @proyecto.id).each do |caracteristica|
            x = CaracteristicasProyecto.find(caracteristica.id)
            estado = nil
            ccp = cc.select {|item|caracteristica.cod_caracteristica == item}
            
            if ccp.count > 0
              cc = cc.select {|item|caracteristica.cod_caracteristica != item}
              if caracteristica.estado == 'I'
                estado = 'A'
              end
            else
              estado = 'I'
            end
            if estado
                x.update(cod_proyecto:@proyecto.id, cod_caracteristica: caracteristica.cod_caracteristica, estado: estado, usu_crea: nil, fec_crea: nil)
            end
        end

        cc.each do |value|
          CaracteristicasProyecto.create(cod_proyecto:@proyecto.id, cod_caracteristica: value, estado: 'A', usu_crea: nil, fec_crea: nil)
        end

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
      params.require(:proyecto).permit(:cod_proyecto, :nombre, :ubicacion, :descripcion_corta, :descripcion_larga, :precio_m2, :mca_favorito, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :departamento, :provincia, :distrito, :latitud, :longitud, :caracteristicas)
    end

    # Only allow a list of trusted parameters through.
    def init
      @variables = Variable.where(estado: 'A')
    end
end
