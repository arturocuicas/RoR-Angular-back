class Api::V1::FamilyGoalController < ApplicationController
  before_action :set_family_goal, only: [:show, :update, :destroy]

  # GET /family_goal
  def index
    @family_goals = FamilyGoal.all
    render json: @family_goals
  end

  # GET /family_goal/1
  def show
    render json: @family_goal
  end

  def create
    @family_goal = FamilyGoal.new(family_goal_params)

    if @family_goal.save
      # vefificamos si existen usuarios sin Familia que coincidan
      render json: @family_goal, status: :created

    else
      render json: @family_goal.errors, status: :unprocessable_entity
    end
  end

  # PUT /family_goal/1
  def update
    if @family_goal.update(family_goal_params)

      # vefificamos si existen usuarios sin Familia que coincidan
      render json: @family_goal
    else
      render json: @family_goal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /family_goal/1
  def destroy
    @family_goal.destroy
    # Pasamos a 0 los usuarios que tenian esta familia asociada
  end

  private
    def set_family_goal
      @family_goal = FamilyGoal.find(params[:id])
    end

    def family_goal_params
      params.require(:family_goal).permit(:name, :position, :area, :world)
    end
end
