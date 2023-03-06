class PlantsController < ApplicationController
  if Rails.env.development?
    before_action do
      Plant.reload(true)
    end
  end

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
