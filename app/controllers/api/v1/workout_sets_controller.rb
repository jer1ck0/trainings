class Api::V1::WorkoutSetsController < ApplicationController
  def index
    workout_sets = WorkoutSet.where(training_id: [create_params[:training_id]])

    render json: workout_sets, status: :ok
  end

  def create
    workout_set = WorkoutSet.new(create_params)
    if workout_set.save
      render json: workout_set, status: :ok
    end
  end

  def update
    
  end

  def destroy
    workout_set = WorkoutSet.find(destroy_params[:id])
    if workout_set.destroy 
      render json: {}, status: :no_content
    else
      render json: { error: 'Failed to delete workout set' }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:training_id, :exersize_id, :sets, :reps)
  end

  def destroy_params
    params.permit(:id, :training_id)
  end
end
