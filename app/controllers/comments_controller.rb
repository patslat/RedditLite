class CommentsController < ApplicationController
  before_filter :authenticate_user

  def show
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
    @comment_tree = Comment.build_comment_tree(@comment.sub_comments)
  end

  def new
  end

  def create
    @parent = Comment.find(params[:parent_comment]) if params[:parent_comment]
    if @parent
      @comment = @parent.sub_comments.build(params[:comment])
      @parent.save
      redirect_to link_url(@comment.link_id)
    else
      @comment = Comment.new(params[:comment])
      @comment.save
      redirect_to link_url(@comment.link_id)
    end
  end


end
