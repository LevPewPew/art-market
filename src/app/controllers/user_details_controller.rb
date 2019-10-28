class UserDetailsController < ApplicationController
  before_action :set_user_detail, only: [:edit, :update]

  def edit
    session[:settings_prev_page] = request.referer
  end

  def update
    respond_to do |format|
      if @user_detail.update(user_detail_params)
        format.html { redirect_to session[:settings_prev_page], notice: 'user_detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_detail }
      else
        format.html { render :edit }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user_detail
      @user_detail = current_user.user_detail
      if @user_detail.nil?
        redirect_to root_path
      end
    end

    def user_detail_params
      params.require(:user_detail).permit(:name, :bio, :user_id)
    end
end
