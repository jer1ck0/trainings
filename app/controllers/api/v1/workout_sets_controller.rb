class Api::V1::WorkoutSetsController < ApplicationController
  def index
    workout_sets = WorkoutSet.where(training_id: [permitted_params[:training_id]])

    render json: workout_sets, status: :ok
  end

  def create
    workout_set = WorkoutSet.new(permitted_params)
    if workout_set.save
      render json: workout_set, status: :ok
    end
  end

  def update
    
  end

  def destroy

  end

  private

  def permitted_params
    params.permit(:training_id, :exersize_id, :sets, :reps)
  end
end
