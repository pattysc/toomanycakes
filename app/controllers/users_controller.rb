class UsersController < ApplicationController

  def login
    if logged_in?
      redirect_to current_user
    end
  end

  def claimed_meals
    @user = current_user
    @meal_ids = @user.all_my_claimed_meals
    #can make this a user method
    #that makes it an array of instances
    #for each meal do...
  end

  def cook
    @meals = current_user.meals
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @group = Group.find_by(name: params[:user][:address])

        if @group
          UserGroup.create(user_id: @user.id, group_id: @group.id )
        else
          @group = Group.new(name: params[:user][:address], description: "Your local group", admin_id: @user.id)
          @group.save
          UserGroup.create(user_id: @user.id, group_id: @group.id )
        end

      redirect_to current_user
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    if logged_in?
      @user = User.find(current_user.id)
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(current_user.id)
    @user.update(update_user_params)
    if @user.valid?
      redirect_to current_user
    else
      flash[:notice] = "User already exists"
      redirect_to edit_user_path(current_user)
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :address, :fullname)
    end

    def update_user_params
      params.require(:user).permit(:name, :address, :fullname)
    end
end
