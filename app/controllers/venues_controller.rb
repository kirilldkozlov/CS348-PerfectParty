class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    @city = params[:city] || ""
    @venues = params[:city].blank? ? Venue.all :
      Venue.joins(venue_address: :address)
        .where(
          Address.arel_table[:city]
            .lower
            .matches("%#{params[:city].downcase}%")
        ).order(:cost)
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @events_hosted = Venue.find_by_sql(["
      SELECT venues.id, venues.name, COUNT(events.venue_id) AS num_events
        FROM events
	      LEFT JOIN venues ON venues.id = events.venue_id
	      WHERE venues.id = ?
	      GROUP BY venues.id, venues.name;
      ", @venue.id])
  end

  # GET /venues/new
  def new
    @venue = Venue.new
    @venue.build_venue_address
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(venue_params)

    respond_to do |format|
      if @venue.save!
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit!
    end
end
