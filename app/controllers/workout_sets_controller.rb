class WorkoutSetsController < ApplicationController

  before_action :set_workout_set, only: [:show, :edit, :update, :destroy]
  before_action :set_workout_set_permission, only: [:permission_policy, :permission]

  def index
    @workout_sets = WorkoutSet.where(training_id: params[:training_id])
  end

  def show
  end

  def new
    @workout_set = WorkoutSet.new
  end

  def edit
  end

  def create
    @workout_set = WorkoutSet.new(workout_set_params)

    respond_to do |format|
      if @workout_set.save
        format.js
        format.html { redirect_to @workout_set, notice: 'Упражнение добавлено' }
        format.json { render :show, status: :created, location: @workout_set }
      else
        byebug
        format.html { render :new }
        format.json { render json: @workout_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_sets/1
  # PATCH/PUT /workout_sets/1.json
  def update
    respond_to do |format|
      if @workout_set.update(workout_set_params)
        format.html { redirect_to edit_workout_set_path(@workout_set), notice: 'WorkoutSet was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout_set }
      else
        format.html { render :edit }
        format.json { render json: @workout_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_sets/1
  # DELETE /workout_sets/1.json
  def destroy
    authorize_action_for @workout_set

    @workout_set.destroy
    respond_to do |format|
      format.html { redirect_to workout_sets_url, notice: 'WorkoutSet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # permission UI page
  def permission_policy
    authorize_action_for @workout_set
    @users = User.at_who session[:username]
  end

  # permission POST API
  def permission
    authorize_action_for @workout_set

    ActiveRecord::Base.transaction do

      username = params[:username]
      workout_set_id = params[:workout_set_id]
      action = params[:control]
      role = case params[:role]
               when 'ROLE_ADMIN';    'admin'
               when 'ROLE_OWNER';    'owner'
               else 'none'
             end

      # get user
      user = User.find_by(username:username)

      # set role - add / remove
      case action
        when 'ADD'
          user.add_role(role, WorkoutSet.find(workout_set_id))
        when 'REMOVE'
          user.remove_role(role, WorkoutSet.find(workout_set_id))
        else nil
      end

    end

  end


  private

    def set_workout_set
      @workout_set = WorkoutSet.find(params[:id])
    end

    def set_workout_set_permission
      @workout_set = WorkoutSet.find(params[:workout_set_id])
    end

    def workout_set_params
      params.require(:workout_set).permit(:comment)
    end

    def workout_set_params
      params.require(:workout_set).permit(:exersize_id, :sets, :reps, :training_id)
    end

    def permission_params
      params.permit(:username, :role, :control)
    end
end
