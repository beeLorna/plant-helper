class PlantQuizController < ApplicationController
  def question
    @plant = Plant.all.sample
    @question_attribute = (params[:q] || "common_name").to_sym
    @question_value = @plant[@question_attribute]
  end

  def answer
    @plant = Plant.find(params[:plant])
    @given_answer = params[:botanical_name]
    @expected_answer = @plant.botanical_name
  end
end
