class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :destroy]
=begin
  before_action :set_train, only: [:new, :create]
=end

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
    @train_id = params[:train_id]
    @ticket = current_user.tickets.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to user_tickets_path
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to user_tickets_path(current_user), notice: 'Ticket was successfully destroyed.'
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

=begin
  def set_train
    @train = Train.find(params[:train_id])
  end
=end

  def ticket_params
    params.require(:ticket).permit(:fio, :passport_information, :first_station_id, :last_station_id, :train_id)
  end
end