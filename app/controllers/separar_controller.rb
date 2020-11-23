class SepararController < ApplicationController
  before_action :set_separar, only: [:show, :edit, :update, :destroy]

  layout "application"

  # GET /separars
  # GET /separars.json
  def index
    @separars = Separar.all
    @variables = Variable.all
  end

  # GET /separars/1
  # GET /separars/1.json
  def show
    @variables = Variable.all
  end

  # GET /separars/new
  def new
    @separar = Separar.new
    @variables = Variable.all
  end

  # GET /separars/1/edit
  def edit
    @variables = Variable.all
  end

  # POST /separars
  # POST /separars.json
  def create
    @separar = Separar.new(separar_params)

    respond_to do |format|
      if @separar.save
        format.html { redirect_to @separar, notice: 'Separar was successfully created.' }
        format.json { render :show, status: :created, location: @separar }
      else
        format.html { render :new }
        format.json { render json: @separar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /separars/1
  # PATCH/PUT /separars/1.json
  def update
    respond_to do |format|
      if @separar.update(separar_params)
        format.html { redirect_to @separar, notice: 'Separar was successfully updated.' }
        format.json { render :show, status: :ok, location: @separar }
      else
        format.html { render :edit }
        format.json { render json: @separar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /separars/1
  # DELETE /separars/1.json
  def destroy
    @separar.destroy
    respond_to do |format|
      format.html { redirect_to separars_url, notice: 'Separar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_separar
      @separar = Separar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def separar_params
      params.require(:separar).permit(:cod_separar, :cod_solictud, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
