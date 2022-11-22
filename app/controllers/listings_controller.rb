class ListingsController < ApplicationController
  def index
    @listings = policy_scope(Listing)
  end

  def show
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to listings_path #! would be good to make this user specific
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @listing
    # TO DO
  end

  def update
    authorize @listing
    # TO DO
  end

  def destroy
    authorize @listing
    # TO DO
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price_per_hour, :location)
  end
end
