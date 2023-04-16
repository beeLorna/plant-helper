class PlantsController < ApplicationController
  if Rails.env.development?
    before_action do
      Plant.reload(true)
    end
  end

  def index
    @plants = if params[:filter_name].present? && params[:filter_value].present?
      Plant.where(
        params[:filter_name].to_sym =>
        # We optimistically convert to an integer and filter by both string and
        # integer forms, so we can handle integer inputs automatically without
        # any custom logic to do different things for different attributes.
        [params[:filter_value], params[:filter_value].to_i]
      )
    else
      Plant.all.order(week: :desc)
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
