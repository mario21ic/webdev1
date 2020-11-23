class VentaController < ApplicationController
  before_action :set_ventum, only: [:show, :edit, :update, :destroy]

  layout "application"

  # GET /venta
  # GET /venta.json
  def index
    @venta = Ventum.all
    @variables = Variable.all
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
    @variables = Variable.all
  end

  # GET /venta/new
  def new
    @ventum = Ventum.new
    @variables = Variable.all
  end

  # GET /venta/1/edit
  def edit
    @variables = Variable.all
  end

  # POST /venta
  # POST /venta.json
  def create
    @ventum = Ventum.new(ventum_params)

    respond_to do |format|
      if @ventum.save
        format.html { redirect_to @ventum, notice: 'Ventum was successfully created.' }
        format.json { render :show, status: :created, location: @ventum }
      else
        format.html { render :new }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venta/1
  # PATCH/PUT /venta/1.json
  def update
    respond_to do |format|
      if @ventum.update(ventum_params)
        format.html { redirect_to @ventum, notice: 'Ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @ventum }
      else
        format.html { render :edit }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    @ventum.destroy
    respond_to do |format|
      format.html { redirect_to venta_url, notice: 'Ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ventum
      @ventum = Ventum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ventum_params
      params.require(:ventum).permit(:cod_venta, :tipo_documento, :numero_documento, :cod_departamento, :cod_solicitud, :tipo_compra, :total, :saldo, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
