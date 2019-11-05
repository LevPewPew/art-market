class UserDetailsController < ApplicationController
  # before_action :set_user_detail, only: [:edit, :update]
  before_action :set_sanitized_user_detail, only: [:edit, :update]
  before_action :set_user_detail_address, only: [:edit, :update]

  def edit
    # the only time user is directed to fill in UserDetail is when making a new listing and there is no address info. this is needed instead of just always request.referer sometimes the user_settings page is reached not by clicking edit settings but by attempting to create a new listing without having enough details.
    if !flash[:new_listing].nil? && flash[:new_listing].include?('Account details are missing!')
      session[:settings_update_next_page] = new_listing_path
    else
      session[:settings_update_next_page] = request.referer
    end
  end

  def update
    respond_to do |format|
      if @user_detail.update(user_detail_params)
        format.html { 
          begin
            redirect_to session[:settings_update_next_page], notice: 'user_detail was successfully updated.'
          rescue
            redirect_to root_url
          end
          }
        format.json { render :show, status: :ok, location: @user_detail }
      else
        format.html { render :edit }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_sanitized_user_detail
      if current_user.nil?
        redirect_to no_access_path
      else
        @user_detail = UserDetail.find(params[:id])
        if !(@user_detail.user_id == current_user.id || current_user.user_detail.super_user)
          redirect_to no_access_path
        end
      end
    end

    def set_user_detail_address
      @address = UserDetail.find(params[:id]).address
    end

    def user_detail_params
      params.require(:user_detail).permit(:name, :bio, :super_user, :comms_mngr, :user_id, address_attributes: [:id, :line_1, :line_2, :city, :state, :postcode, :user_detail_id])
    end
end
