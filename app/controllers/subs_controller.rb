class SubsController < ApplicationController
  before_filter :authenticate_user
  def index
    @subs = Sub.all
  end

  def new
  end

  def create
    @sub = Sub.new(params[:sub])
    if @sub.save
      redirect_to subs_url
    else
      render :new
    end
  end
end
