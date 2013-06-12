class LinksController < ApplicationController
  before_filter :authenticate_user

  def index
    @links = Sub.find(params[:sub_id]).links
  end

  def new
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      redirect_to links_url
    else
      render :new
    end
  end
end
