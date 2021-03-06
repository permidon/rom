class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: t('.success')
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:fullname, :passport, :train_id, :first_station_id, :last_station_id)
  end

end