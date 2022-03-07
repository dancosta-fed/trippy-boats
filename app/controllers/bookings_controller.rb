class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user

    authorize @booking

    if @booking.save
      redirect_to boat_path(@boat)
      flash[:notice] = "Your booking is done"
    else
      flash[:alert] = "Oops!! You need to fill in the form!"
      render 'boats/show'
    end
  end

  def destroy
    authorize current_user
    @booking = Booking.find(booking)
    @booking.destroy
    redirect_to users, notice: 'Your booking was successfully canceled.'
  end

  private

  def booking_params
    params.require(:booking).permit([:start_date, :end_date])
  end
end
