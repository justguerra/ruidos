class DispositivosController < ApplicationController
  before_action :set_dispositivo, only: [:show, :edit, :update, :destroy]

  # GET /dispositivos
  def index
    @dispositivos = Dispositivo.all
  end

  # GET /dispositivos/1
  def show
  end

  # GET /dispositivos/new
  def new
    @dispositivo = Dispositivo.new
  end

  # GET /dispositivos/1/edit
  def edit
  end

  # POST /dispositivos
  def create
    @dispositivo = Dispositivo.new(dispositivo_params)

    if @dispositivo.save
      redirect_to @dispositivo, notice: 'Dispositivo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dispositivos/1
  def update
    if @dispositivo.update(dispositivo_params)
      redirect_to @dispositivo, notice: 'Dispositivo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dispositivos/1
  def destroy
    @dispositivo.destroy
    redirect_to dispositivos_url, notice: 'Dispositivo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispositivo
      @dispositivo = Dispositivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dispositivo_params
      params.require(:dispositivo).permit(:name, :local, :lat, :long)
    end
end
