class ListingsController < ApplicationController
  def index
    @listings = policy_scope(Listing)
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
    @markers = [ {lat: @listing.latitude,
                  lng: @listing.longitude,
                  info_window: render_to_string(partial: "info_window", locals: {listing: @listing})
                },
                { lat: current_user.latitude,
                  lng: current_user.longitude,
                  info_window: "<br><p>Your location</p>"
                }
              ]
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
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def update
    @listing = Listing.find(params[:id])
    authorize @listing

    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listings_path, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
        # need to check these erroes works (no validations)
      end
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    authorize @listing
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_path, notice: "Listing was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price_per_hour, :location)
  end

end
