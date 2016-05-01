class DvdsController < ApplicationController
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]
  before_action :set_location

  # GET /dvds
  # GET /dvds.json
  def index
    #TODO: Fancy searching here
    @locations = Location.all
    if location_filter_params.present?
      conditions = location_filter_params.delete_if {|k,v| v.empty?}
      dvd_locations = Location.includes(dvds: :home_theater_info).where(conditions)
      @dvds = dvd_locations.collect {|l| l.dvds}.flatten
    else
      @dvds = Dvd.includes(:home_theater_info).all
    end
  end

  # GET /dvds/1
  # GET /dvds/1.json
  def show
  end

  # GET /dvds/new
  def new
    @dvd = Dvd.new
    @locations = Location.all.ordered
  end

  # GET /dvds/1/edit
  def edit
    @locations = Location.all.ordered
  end

  # POST /dvds
  # POST /dvds.json
  def create
    @dvd = Dvd.new(dvd_params)
    info = get_home_theater_info
    @dvd.home_theater_info  = info if info

    respond_to do |format|
      if @dvd.save
        format.html { redirect_to @dvd, notice: 'Dvd was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def upc_create
    info = get_home_theater_info
    if info
      @dvd = Dvd.find_or_create_by(home_theater_info: info, location: @location)
      if @dvd.save
        flash[:success] = 'DVD was successfully created.'
        redirect_to get_path
      else
        flash[:error] = 'Something went wrong, DVD not created.'
        redirect_to get_path
      end
    else
      flash[:error] = 'DVD not found in database, you will have to manually add it.'
      redirect_to get_path
    end
  end

  # PATCH/PUT /dvds/1
  # PATCH/PUT /dvds/1.json
  def update
    info = get_home_theater_info

    respond_to do |format|
      if @dvd.update(dvd_params)
        @dvd.update(home_theater_info: info) if info
        format.html { redirect_to @dvd, notice: 'Dvd was successfully updated.' }
        format.json { render :show, status: :ok, location: @dvd }
      else
        format.html { render :edit }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dvds/1
  # DELETE /dvds/1.json
  def destroy
    @dvd.destroy
    respond_to do |format|
      format.html { redirect_to dvds_url, notice: 'Dvd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_home_theater_info
      HomeTheaterInfo.find_by_upc(params[:upc_code])
    end

    def get_path
      @location.present? ? new_location_dvd_path(@location) : new_dvd_path
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_dvd
      @dvd = Dvd.find(params[:id])
    end

    def set_location
      @location = (params[:location_id]) ? Location.find(params[:location_id]) : nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dvd_params
      params.require(:dvd).permit(:title, :genre, :note)
    end

    def location_filter_params
      params.permit(:shelf, :row, :stack)
    end
end
