class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
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

  def new
    @boat = Boat.new
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

  def show
  end

  def search
    if boat_params[:search].blank?
      redirect_to boats_path and return
    else
      @parameter = params[:search].downcase
      @results = Boats.all.where('lower(name) LIKE :search', search: "%#{@parameter}%")
    end
  end

  private

  # def user_status
  #   user_signed_in?
  # end

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :price, :location)
  end
end
