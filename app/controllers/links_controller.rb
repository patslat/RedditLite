class LinksController < ApplicationController
  before_filter :authenticate_user

  def index
    @links = Sub.find(params[:sub_id]).links
  end

  def show
    @link = Link.find(params[:id])
    @comment_tree = @link.comments
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
