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

    @sort_by = :botanical_name
    if index_sort_params[:sort_by]
      @sort_by = index_sort_params[:sort_by].to_sym
    end

    @sort_order = :asc
    if index_sort_params[:sort_order]
      @sort_order = index_sort_params[:sort_order].to_sym
    end

    @plants = Plant.where(filter).sort_by { |plant|
      attribute = plant[@sort_by]
      if attribute.respond_to?(:downcase)
        attribute = attribute.downcase
      end

      attribute
    }

    if @sort_order == :desc
      @plants.reverse!
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  private

  def index_filter_params
    params.permit(:only_shuttleworth_cultivar, :only_drought_resistant, :only_biodiversity_wildlife)
  end

  def index_sort_params
    params.permit(:sort_by, :sort_order)
  end
end
