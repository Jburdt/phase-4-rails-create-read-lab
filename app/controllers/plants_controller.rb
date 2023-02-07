class PlantsController < ApplicationController

  # GET /plants
  def index
    plant = Plant.all 
    render json: plant
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  #Post /birds
  def create
    a_plant = Plant.create(plant_params)
    render json: a_plant, status: :created
  end

  private
  def plant_params
    params.permit(:name, :image, :price)
  end

end
