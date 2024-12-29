class ExersizesController < ApplicationController
  def index
    
  end

  def create
    @exersize = Exersize.new(creator_id: current_user.id)
    respond_to do |format|
      if @exersize.save
        format.html { redirect_to edit_training_path(@training.id), notice: 'Тренировка успешно начата' }
        format.json { render :edit, status: :created, location: @training }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end
end
