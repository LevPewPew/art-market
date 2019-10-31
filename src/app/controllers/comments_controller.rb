class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_listing, only: [:edit, :destroy]

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to listing_path(@comment.listing_id)
    else
      flash[:comment_errors] = @comment.errors
      redirect_to listing_path(@comment.listing_id)
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to listing_path(@comment.listing_id)
    else
      flash[:comment_errors] = @comment.errors
      redirect_to listing_path(@comment.listing_id)
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @listing, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :listing_id, :user_id)
    end
end
