class SearchesController < ApplicationController
  def show
    @routes = Route.search(params)
    @stations = Station.all
  end
end
