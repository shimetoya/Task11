class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to @station, notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  def update
    if @station.update(station_params)
      redirect_to @station, notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to stations_url, notice: 'Station was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:title)
    end
end
