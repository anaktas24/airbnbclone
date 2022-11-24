class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @listings = Listing.where(category_type: params[:query])
    else
      @listings = Listing.all
    end
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :profile
    end

  end



  private

  def user_params
    params.require(:user).permit(:name, :address, :phone)
  end
end
