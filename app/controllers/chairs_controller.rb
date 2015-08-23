class ChairsController < ApplicationController
  before_action :set_chair, only: [:show, :edit, :update, :destroy]

  # GET /chairs
  def index
    @chairs = Chair.all
  end

  # GET /chairs/1
  def show
  end

  # GET /chairs/new
  def new
    @chair = Chair.new
  end

  # GET /chairs/1/edit
  def edit
  end

  # POST /chairs
  def create
    @chair = Chair.new(chair_params)

    if @chair.save
      redirect_to @chair, notice: 'Chair was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /chairs/1
  def update
    if @chair.update(chair_params)
      redirect_to @chair, notice: 'Chair was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chairs/1
  def destroy
    @chair.destroy
    redirect_to chairs_url, notice: 'Chair was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chair
      @chair = Chair.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chair_params
      params.require(:chair).permit(:active)
    end
end
