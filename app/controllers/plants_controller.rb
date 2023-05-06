class PlantsController < ApplicationController
  if Rails.env.development?
    before_action do
      Plant.reload(true)
    end
  end

  def index
    filter = {}
    index_filter_params.each do |key, value|
      only_key_match = /^only_(?<attribute_name>.+)$/.match(key)
      if only_key_match && ActiveModel::Type::Boolean.new.cast(value)
        filter[only_key_match[:attribute_name].to_sym] = true
      end
    end

    @plants = Plant.where(filter).sort_by(&:week).reverse
  end

  def show
    @plant = Plant.find(params[:id])
  end

  private

  def index_filter_params
    params.permit(:only_shuttleworth_cultivar, :only_drought_resistant, :only_biodiversity_wildlife)
  end
end
