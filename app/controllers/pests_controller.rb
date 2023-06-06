class PestsController < ApplicationController
  if Rails.env.development?
    before_action do
      Pest.reload(true)
    end
  end

  def index
    @pests = Pest.all
  end

  def show
    @pest = Pest.find(params[:id])
  end
end
