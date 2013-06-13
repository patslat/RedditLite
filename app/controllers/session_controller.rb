class SessionController < ApplicationController
  before_filter :authenticate_user, :only => :destroy
  def new
  end

  def create
    @user = User.find_by_username(params[:username])


    p @user

    if @user && @user.authenticate_password(params[:password])
      session[:token] = @user.reset_session_token
      @user.save
      redirect_to users_url
    else
      flash[:notice] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    user = current_user
    user.session_token = nil
    user.save
    session[:token] = nil
    @current_user = nil
    render :new
  end

end
