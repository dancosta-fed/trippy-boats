class BoatsController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]
      @boats = Boat.where("name ILIKE ?","%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @boats = Boat.all
    end
  end
end
