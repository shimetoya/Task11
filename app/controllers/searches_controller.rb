class SearchesController < ApplicationController
  def show
    @routes = Route.search(params)
    @stations = Station.all
    params[:start_station_id] ||= Route.first.stations.first.id
    params[:end_station_id] ||= Route.first.stations.last.id
  end
end
