class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @boats = policy_scope(Boat).where("name ILIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @boats = policy_scope(Boat)
    end
  end

  def show
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

  def search
    if boat_params[:search].blank?
      redirect_to boats_path and return
    else
      @parameter = boat_params[:search].downcase
      @results = Boats.all.where('name LIKE :search OR location LIKE :search', search: "%#{@parameter}%")
    end
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
    params.require(:boat).permit(:name, :location, :description, :price)
  end
end
