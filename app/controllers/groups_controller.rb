class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
        @user = User.find(session[:user_id])
        @group.users << @user
        flash[:notice] = "You successfully created the #{@group.name} group"
        redirect_to group_path(@group)
    else
      flash[:notice] = "You were not able to create the #{@group.name} group"
      redirect_to new_group_path
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def join
    @group = Group.find(params[:group_id])
    if logged_in?
      @user = User.find(session[:user_id])
      @group.users << @user
      flash[:notice] = "You joined the #{@group.name} group"
      redirect_to group_path(@group)
    else
      flash[:notice] = "You were not able to join the #{@group.name} group"
      redirect_to group_path(@group)
    end
  end

  def quit
    @group = Group.find(params[:group_id])
    @user = User.find(session[:user_id])

    @group.users.delete(@user)

    # flash[:notice] = "You left the group.  Tears."

    redirect_to group_path(@group)

  end



  private

  def group_params
    params.require(:group).permit(:name)
  end

end
