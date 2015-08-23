class SensorDataController < ApplicationController
  before_action :set_sensor_datum, only: [:show, :edit, :update, :destroy]

  # GET /sensor_data
  def index
    @sensor_data = SensorDatum.all
  end

  # GET /sensor_data/1
  def show
  end

  # GET /sensor_data/new
  def new
    @sensor_datum = SensorDatum.new
  end

  # GET /sensor_data/1/edit
  def edit
  end

  # POST /sensor_data
  def create
    @sensor_datum = SensorDatum.new(sensor_datum_params)

    if @sensor_datum.save
      redirect_to @sensor_datum, notice: 'Sensor datum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sensor_data/1
  def update
    if @sensor_datum.update(sensor_datum_params)
      redirect_to @sensor_datum, notice: 'Sensor datum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sensor_data/1
  def destroy
    @sensor_datum.destroy
    redirect_to sensor_data_url, notice: 'Sensor datum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor_datum
      @sensor_datum = SensorDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sensor_datum_params
      params.require(:sensor_datum).permit(:ruido)
    end
end
