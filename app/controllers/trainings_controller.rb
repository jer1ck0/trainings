class TrainingsController < ApplicationController

  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :set_training_permission, only: [:permission_policy, :permission]

  def index
    @trainings = if current_user.has_role_admin?
      Training.all.paginate(page: params[:page], per_page:10) # paging
    else
      Training.for_current_user(current_user).paginate(page: params[:page], per_page:10)
    end
  end

  def show
  end

  def new
    @training = Training.new
  end

  def edit
    @workout_set = @training.workout_sets.new
  end

  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save

        # add owner
        current_user.add_role(:owner, @training)

        format.html { redirect_to @training, notice: 'Тренировка успешно начата' }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to edit_training_path(@training), notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    authorize_action_for @training

    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'Training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # permission UI page
  def permission_policy
    authorize_action_for @training
    @users = User.at_who session[:username]
  end

  # permission POST API
  def permission
    authorize_action_for @training

    ActiveRecord::Base.transaction do

      username = params[:username]
      training_id = params[:training_id]
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
          user.add_role(role, Training.find(training_id))
        when 'REMOVE'
          user.remove_role(role, Training.find(training_id))
        else nil
      end

    end

  end


  private

    def set_training
      @training = Training.find(params[:id])
    end

    def set_training_permission
      @training = Training.find(params[:training_id])
    end

    def training_params
      params.require(:training).permit(:comment, workout_sets_attributes: [:sets, :reps, :exersize_id])
    end

    def permission_params
      params.permit(:username, :role, :control)
    end
end
