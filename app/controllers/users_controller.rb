class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      redirect_to users_path, notice: "User was successfully created."
    else
      render :new
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to users_path, notice: "User was updated."
    else
      render :edit  
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was deleted."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,)
  end

end
