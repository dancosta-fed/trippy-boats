class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].blank?
      @boats = policy_scope(Boat)
    else
     # @parameter = boat_params[:search].downcase
      @boats = policy_scope(Boat).search_keyword(params[:query])
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def edit
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user

    authorize @boat
    if @boat.save
      redirect_to boats_path
    else
      render :new
    end
  end

  def update
    authorize @boat
    if @boat.update(boat_params)
      redirect_to @boat, notice: 'boat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @boat
    @boat.destroy
    redirect_to boats_url, notice: 'boat was successfully destroyed.'
  end

  private

  # def user_status
  #   user_signed_in?
  # end

  def set_boat
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :price, :location, :photo)
  end
end
