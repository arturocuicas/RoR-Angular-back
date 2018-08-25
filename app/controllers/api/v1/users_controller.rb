class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    @family_goal = FamilyGoal.all
    render json: { user: @users, @family_goal }, status: :ok
  end

 # POST /users
 def create
   @user = User.new(user_params)

   # Verificamos si el Usuario Creado coincide con alguna Familia
   @family_goal = FamilyGoal.find_by(
     position: user_params[:position].upcase, area: user_params[:area].upcase,
     world: user_params[:world].upcase)

  if !@family_goal.nil?
    @user[:family_goal_id] = @family_goal[:id]
  else
    @user[:family_goal_id] = 0
  end
   if @user.save
     render json: @user, status: :created
   else
     render json: @user.errors, status: :unprocessable_entity
   end
  end

  # GET /users/1
  def show
    @family_goal = FamilyGoal.find_by(id: @user[:family_goal_id])
    render json: {
      user: @user, family_goal: @family_goal
    }
  end

  # UPDATE /users/1
  def update

    # Verificamos nuevamente si coincide con alguna Familia
    @family_goal = FamilyGoal.find_by(
      position: user_params[:position].upcase, area: user_params[:area].upcase,
      world: user_params[:world].upcase)

     if !@family_goal.nil?
       @user[:family_goal_id] = @family_goal[:id]
     else
       @user[:family_goal_id] = 0
     end

    if @user.update(user_params)

      #
      @family_goal = FamilyGoal.find_by(id: @user[:family_goal_id])

      render json: {
        user: @user, family_goal: @family_goal
      }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

   private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :position, :area, :world, :family_goal_id)
    end

end
