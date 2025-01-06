module Api
  module V1
    class TrainingsController < ApplicationController
      before_action :authenticate_request

      def index
        trainings = Training.for_user current_user

        render json: { trainings: trainings }, status: :ok
      end

      def create
        training = Training.new(user_id: current_user.id)
        if training.save
          render json: { training: training }, status: :created
        end
      end

      def show
        training = Training.for_user(current_user).find(params[:id])

        if training
          render json: { training: training }, status: :ok
        end
      end

      def update
        training = Training.for_user(current_user).find(params[:id])

        if training.update(training_params)
          render json: { training: training }, status: :ok
        end
      end

      def destroy
        training = Training.for_user(current_user).find(params[:id])
        if training.destroy
          render json: {}, status: :no_content
        end
      end

      private

      def training_params
        params.require(:training).permit(:description)
      end
    end
  end
end