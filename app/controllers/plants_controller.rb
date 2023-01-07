class PlantsController < ApplicationController
  def show
    @plant = Plant.find("cuprocyparis-leylandii")
  end
end