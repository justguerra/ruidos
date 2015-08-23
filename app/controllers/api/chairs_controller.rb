module Api  
  class ChairsController < ApplicationController

 skip_before_action :verify_authenticity_token

  # GET /chairs
  def index
    respond_to do |format|
      @chairs = Chair.all
      format.html { render action: 'index' }
      format.json { render json:  @chair, status: 200 }
    end
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


    respond_to do |format|
      if @chair.save
        format.html { redirect_to @event, notice: 'save foi criado com sucesso!' }
        format.json { render action: 'show', status: :created, location: @chair }
      else
        format.html { render action: 'new' }
        format.json { render json: @chair.errors, status: :unprocessable_entity }
      end
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


    def chair_params
      params.require(:chair).permit(:active)
    end

    def query_params
        # this assumes that an chair belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:active)
      end
  end
end
