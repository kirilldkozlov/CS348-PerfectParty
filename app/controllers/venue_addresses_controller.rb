class VenueAddressesController < ApplicationController
  before_action :set_venue_address, only: [:show, :edit, :update, :destroy]

  # GET /venue_addresses
  # GET /venue_addresses.json
  def index
    @venue_addresses = VenueAddress.all
  end

  # GET /venue_addresses/1
  # GET /venue_addresses/1.json
  def show
  end

  # GET /venue_addresses/new
  def new
    @venue_address = VenueAddress.new
  end

  # GET /venue_addresses/1/edit
  def edit
  end

  # POST /venue_addresses
  # POST /venue_addresses.json
  def create
    @venue_address = VenueAddress.new(venue_address_params)

    respond_to do |format|
      if @venue_address.save
        format.html { redirect_to @venue_address, notice: 'Venue address was successfully created.' }
        format.json { render :show, status: :created, location: @venue_address }
      else
        format.html { render :new }
        format.json { render json: @venue_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venue_addresses/1
  # PATCH/PUT /venue_addresses/1.json
  def update
    respond_to do |format|
      if @venue_address.update(venue_address_params)
        format.html { redirect_to @venue_address, notice: 'Venue address was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue_address }
      else
        format.html { render :edit }
        format.json { render json: @venue_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venue_addresses/1
  # DELETE /venue_addresses/1.json
  def destroy
    @venue_address.destroy
    respond_to do |format|
      format.html { redirect_to venue_addresses_url, notice: 'Venue address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue_address
      @venue_address = VenueAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_address_params
      params.require(:venue_address).permit(:id, :venue_id, :address_id)
    end
end
