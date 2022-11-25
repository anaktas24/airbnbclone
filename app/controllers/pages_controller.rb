class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if user_signed_in?
      @default_radius = 50
      @listings = Listing.near([current_user.latitude, current_user.longitude], @default_radius, order: 'distance').limit(24)
    else
      @listings = Listing.all.order('created_at DESC').limit(24)
    end

    @listings = Listing.where(category_type: params[:query]) if params[:query].present?

    @listings = Listing.order(params[:order_by] => params[:order]) if params[:order_by].present?

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
