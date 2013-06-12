class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #log in
      redirect_to user_url(@user) #change this later
    else
      flash[:notice] = "Failed to create user"
      render :new
    end
  end
end
