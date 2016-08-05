class SeatsController < ApplicationController
  before_action :set_seat, only: [:show, :edit, :update, :destroy]

  def index
    @seats = Seat.all
  end

  def show
  end

  def new
    @seat = Seat.new
  end

  def edit
  end

  def create
    @seat = Seat.new(seat_params)
    if @seat.save
      redirect_to @seat, notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  def update
    if @seat.update(seat_params)
      redirect_to @seat, notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @seat.destroy
    redirect_to seats_path, notice: 'Station was successfully destroyed.'
  end

  private
  def set_seat
    @seat = Seat.find(params[:id])
  end

  def seat_params
    params.require(:seat).permit(:seat_type, :amount_seats, :car_id)
  end
end