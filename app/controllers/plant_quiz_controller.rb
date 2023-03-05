class PlantQuizController < ApplicationController
  def question
    @plant = Plant.all.sample
    @question_value = @plant.common_name
  end

  def answer
    @plant = Plant.find(params[:plant])
    @given_answer = params[:botanical_name]
    @expected_answer = @plant.botanical_name
  end
end
