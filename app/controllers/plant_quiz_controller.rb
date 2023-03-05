class PlantQuizController < ApplicationController
  def question
    @question_attribute = (params[:q] || "common_name").to_sym
    @answer_attribute = (params[:a] || "botanical_name").to_sym

    @plant = Plant.all.sample
    @question_value = @plant[@question_attribute]
  end

  def answer
    plant_id = params[:plant]

    @answer_attribute = params[:answer_attribute].to_sym
    @given_answer = params[@answer_attribute]

    @plant = Plant.find(plant_id)
    @expected_answer = @plant[@answer_attribute]
  end
end
