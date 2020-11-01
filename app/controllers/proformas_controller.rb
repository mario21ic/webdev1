class ProformasController < ApplicationController
  before_action :set_proforma, only: [:show, :edit, :update, :destroy]

  # GET /proformas
  # GET /proformas.json
  def index
    @proformas = Proforma.all
  end

  # GET /proformas/1
  # GET /proformas/1.json
  def show
  end

  # GET /proformas/new
  def new
    @proforma = Proforma.new
  end

  # GET /proformas/1/edit
  def edit
  end

  # POST /proformas
  # POST /proformas.json
  def create
    @proforma = Proforma.new(proforma_params)

    respond_to do |format|
      if @proforma.save
        format.html { redirect_to @proforma, notice: 'Proforma was successfully created.' }
        format.json { render :show, status: :created, location: @proforma }
      else
        format.html { render :new }
        format.json { render json: @proforma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proformas/1
  # PATCH/PUT /proformas/1.json
  def update
    respond_to do |format|
      if @proforma.update(proforma_params)
        format.html { redirect_to @proforma, notice: 'Proforma was successfully updated.' }
        format.json { render :show, status: :ok, location: @proforma }
      else
        format.html { render :edit }
        format.json { render json: @proforma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proformas/1
  # DELETE /proformas/1.json
  def destroy
    @proforma.destroy
    respond_to do |format|
      format.html { redirect_to proformas_url, notice: 'Proforma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proforma
      @proforma = Proforma.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proforma_params
      params.require(:proforma).permit(:cod_proforma, :cod_solictud, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
