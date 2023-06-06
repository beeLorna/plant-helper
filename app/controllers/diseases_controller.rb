class DiseasesController < ApplicationController
  if Rails.env.development?
    before_action do
      Disease.reload(true)
    end
  end

  def index
    @diseases = Disease.all
  end

  def show
    @disease = Disease.find(params[:id])
  end
end
