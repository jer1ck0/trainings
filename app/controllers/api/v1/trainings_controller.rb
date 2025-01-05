module Api
  module V1
    class TrainingsController < ApplicationController
      before_action :authenticate_request

      def index
        trainings = Training.for_user current_user

        render json: { trainings: trainings }, status: :ok
      end

      def create
        p 'create'
      end

      def update
        p 'update'
      end

      def destroy
        p 'destroy'
      end
    end
  end
end