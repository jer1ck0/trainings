module Api
  module V1
    class ExersizesController < ApplicationController
      before_action :authenticate_request, only: [:create]

      def body_parts
        render json: BodyPart.all, status: :ok
      end

      def index
        exersizes = Exersize.for_body_part(index_params[:body_part_id])
        if exersizes
          render json: exersizes, status: :ok
        end
      end

      def create
        exersize = Exersize.new(create_params)
        if exersize.save
          render json: { exersize: ::Api::V1::ExersizeSerializer.new(exersize) }, status: :created
        end
      end

      private

      def index_params
        params.permit(:body_part_id)
      end

      def create_params
        params.require(:exersize).permit(:user_id, :name, :comment, :countable, :body_part_id)
      end
    end
  end
end