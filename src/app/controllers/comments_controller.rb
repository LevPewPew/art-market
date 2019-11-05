class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  before_action :set_listing, only: [:edit, :update, :destroy]
  before_action :set_sanitized_comment, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  # changed from the scaffold generated errors to flash errors due to new Comment form nested on a Listing show page
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

    def set_sanitized_comment
      if current_user.nil?
        redirect_to no_access_path
      else
        @comment = @listing.comments.find_by(id: params[:id])
        if !(current_user.id == @comment.user_id || current_user.user_detail.super_user || current_user.user_detail.comms_mngr)
          redirect_to no_access_path
        end
      end
    end

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :listing_id, :user_id)
    end
end
