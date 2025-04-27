module Api
  module V1
    class ExersizesController < ApplicationController
      before_action :authenticate_request, only: [:create]

      def body_parts
        enriched_body_parts = Exersize::BODY_PARTS.each_with_object({}) do |body_part, result|
          result[body_part] = I18n.t("exersizes.body_parts.#{body_part}")
        end

        render json: enriched_body_parts, status: :ok
      end

      def index
        exersizes = Exersize.for_body_part(index_params[:body_part])
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
        params.permit(:body_part)
      end

      def create_params
        params.require(:exersize).permit(:user_id, :name, :comment, :countable, :body_part)
      end
    end
  end
end