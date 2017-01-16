class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :destroy, :edit, :update]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  # def new
  #   @ticket = Ticket.new
  # end
  #
  # def create
  #   @ticket = current_user.tickets.new(ticket_params)
  #
  #   if @ticket.save
  #     redirect_to [:admin, @ticket], notice: 'Ticket was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:fullname, :passport)
  end

end