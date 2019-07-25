class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params.except(:client_exist, :venue_exist))

    respond_to do |format|
      if @address.save
        if address_params[:client_exist] == "1"
          format.html { redirect_to new_client_with_address_path(address: @address.id), notice: 'Address was successfully created.' }
        elsif address_params[:venue_exist] == "1"
          format.html { redirect_to new_venue_with_address_path(address: @address.id), notice: 'Address was successfully created.' }
        else
          format.html { redirect_to @address, notice: 'Address was successfully created.' }
          format.json { render :show, status: :created, location: @address }
        end
      else
        if address_params[:client_exist] == "1"
          @client = 1
          format.html { render action: :new }
        elsif address_params[:venue_exist] == "1"
          @venue = 1
          format.html { render action: :new }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params.except(:client_exist, :venue_exist))
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:street_num, :street_name, :postal_code, :city, :province, :client_exist, :venue_exist)
    end
end
