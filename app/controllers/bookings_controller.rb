class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to bookings_path, notice: "Booking was updated and the request has been reissued to booking owner." }
        format.json { render :show, status: :ok, location: @booking }
        @booking.status = "pending"
        @booking.save
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        # need to check these erroes works (no validations)
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_path, notice: "Booking was successfully cancelled." }
      format.json { head :no_content }
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
