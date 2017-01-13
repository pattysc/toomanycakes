class GroupsController < ApplicationController
  before_action :authorize_user

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @user = User.find(session[:user_id])
    @group.admin_id = @user.id
    if @group.save
        @group.users << @user
        flash[:notice] = "You successfully created the #{@group.name} group"
        redirect_to group_path(@group)
    else
      flash[:notice] = @group.errors.full_messages
      redirect_to new_group_path
    end
  end

  def show
    @group = Group.find(params[:id])
    @admin = User.find(@group.admin_id)
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

  def edit
    @group = Group.find(params[:id])
    redirect_to root_path unless current_user.id == @group.admin_id
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    if @group.valid?
      redirect_to groups_path
    else
      flash[:notice] = @group.erros.full_messages
      redirect_to edit_group_path
    end
  end

  def quit
    @group = Group.find(params[:group_id])
    @user = User.find(session[:user_id])
    @group.users.delete(@user)
    # flash[:notice] = "You left the group.  Tears."
    redirect_to group_path(@group)
  end

  def destroy
    Group.find(params[:group_id]).delete
    flash[:notice] = "You successfully deleted the group"
    redirect_to groups_path
  end


  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
