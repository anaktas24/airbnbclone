class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :confirm, :reject]

  def index
    @listing = Listing.find(params[:listing_id])
    @bookings = Booking.where(listing: @listing)
  end

  def confirm
    @booking.status = "confirmed"
    if @booking.save
      redirect_to action: :show, id: @booking.id
    else
      redirect_to action: :show, id: @booking.id
    end
  end

  def reject
    @booking.status = "rejected"
    if @booking.save
      redirect_to action: :show, id: @booking.id
    else
      redirect_to action: :show, id: @booking.id
    end
  end

  def my_bookings
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
    @listing = @booking.listing
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params) # this gets the date
    @booking.listing_id = @listing.id
    @booking.user_id = current_user.id # this works
    @booking.status = "pending" # this works
    authorize @booking
    # raise
    if @booking.save
      respond_to do |format|
        format.html { redirect_to my_bookings_path, notice: "Booking was created and the request has been issued to the listing owner." }
        format.json { head :no_content }
      end
    else
      redirect_to listing_bookings_path, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @listing = @booking.listing
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to my_bookings_path, notice: "Booking was updated and the request has been reissued to the listing owner." }
        format.json { render :show, status: :ok, location: @booking }
        @booking.status = "pending"
        @booking.save
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        # need to check these errors works (no validations)
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking

    if @booking.destroy
      respond_to do |format|
        format.html { redirect_to my_bookings_path, notice: "Booking was successfully cancelled." }
        format.json { head :no_content }
      end
    else
      redirect_to my_bookings_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
