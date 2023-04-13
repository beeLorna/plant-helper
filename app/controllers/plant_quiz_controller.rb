class PlantQuizController < ApplicationController
  QUESTION_COMBINATIONS = [
    {question_attribute: :common_name, answer_attribute: :botanical_name},
    {question_attribute: :botanical_name, answer_attribute: :common_name},
    {question_attribute: :description, answer_attribute: :common_name}
  ].freeze

  def question
    if params[:q] && params[:a]
      @question_attribute = params[:q].to_sym
      @answer_attribute = params[:a].to_sym
    elsif params[:q]
      @question_attribute = params[:q].to_sym
      combo = QUESTION_COMBINATIONS.select { |c| c[:question_attribute] == @question_attribute }.sample
      @answer_attribute = combo[:answer_attribute] || :botanical_name
    elsif params[:a]
      @answer_attribute = params[:a].to_sym
      combo = QUESTION_COMBINATIONS.select { |c| c[:answer_attribute] == @answer_attribute }.sample
      @question_attribute = combo[:question_attribute] || :common_name
    else
      combo = QUESTION_COMBINATIONS.sample
      @question_attribute = combo[:question_attribute]
      @answer_attribute = combo[:answer_attribute]
    end

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