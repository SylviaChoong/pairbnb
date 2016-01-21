class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @listing = Reservation.last.listing
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = current_user.reservations.new(reservation_params)
    @result = Braintree::Transaction.sale(
              amount: Listing.find(params[:reservation][:listing_id]).price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      respond_to do |format|
        if @reservation.save
          @customer = @reservation.user
          @host = @reservation.listing.user.email
          @reservation_list_id = @reservation.listing_id
          @reservation_id = @reservation.id
          ReservationMailer.booking_email(@customer, @host, @reservation_list_id, @reservation_id).deliver_now
          format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
          format.json { render :show, status: :created, location: @reservation }
        else
          render :edit
          format.html { render :new }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :show
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:guests, :startdate, :enddate, :listing_id)
    end

    def generate_client_token
      Braintree::ClientToken.generate
    end
end
