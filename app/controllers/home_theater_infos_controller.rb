class HomeTheaterInfosController < ApplicationController
  before_action :set_home_theater_info, only: [:show, :edit, :update, :destroy]

  # GET /home_theater_infos
  # GET /home_theater_infos.json
  def index
    @home_theater_infos = HomeTheaterInfo.search(params[:page], params[:search])
  end

  # GET /home_theater_infos/1
  # GET /home_theater_infos/1.json
  def show
  end

  # GET /home_theater_infos/new
  def new
    @home_theater_info = HomeTheaterInfo.new
  end

  # GET /home_theater_infos/1/edit
  def edit
  end

  # POST /home_theater_infos
  # POST /home_theater_infos.json
  def create
    @home_theater_info = HomeTheaterInfo.new(home_theater_info_params)

    respond_to do |format|
      if @home_theater_info.save
        format.html { redirect_to @home_theater_info, notice: 'Home theater info was successfully created.' }
        format.json { render :show, status: :created, location: @home_theater_info }
      else
        format.html { render :new }
        format.json { render json: @home_theater_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_theater_infos/1
  # PATCH/PUT /home_theater_infos/1.json
  def update
    respond_to do |format|
      if @home_theater_info.update(home_theater_info_params)
        format.html { redirect_to @home_theater_info, notice: 'Home theater info was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_theater_info }
      else
        format.html { render :edit }
        format.json { render json: @home_theater_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_theater_infos/1
  # DELETE /home_theater_infos/1.json
  def destroy
    @home_theater_info.destroy
    respond_to do |format|
      format.html { redirect_to home_theater_infos_url, notice: 'Home theater info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    HomeTheaterInfo.import(params[:file])
    redirect_to root_url, notice: "Home Theater Info imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_theater_info
      @home_theater_info = HomeTheaterInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_theater_info_params
      params.fetch(:home_theater_info, {})
    end
end
