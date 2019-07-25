class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @cost = 0

    @event.event_items.each do |event_item|
      @cost = @cost + (event_item.quantity * event_item.item.cost)
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def upcoming
    unless params[:name].blank?
        @name = params[:name]

        @upcoming_events = Event.find_by_sql(["
          SELECT events.id AS event_id, events.client_id, events.venue_id, events.menu_id, events.attendees, events.date
          	FROM events
            LEFT JOIN clients ON events.client_id = clients.id
            WHERE (LOWER(clients.first_name) LIKE ? OR  LOWER(clients.last_name) LIKE ?)
            AND (events.date >= ?)
            ORDER BY events.date DESC
            LIMIT 5;
          ", "%#{@name.downcase}%", "%#{@name.downcase}%", DateTime.now])
      end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params.except(:decor_count, :ent_count, :supplier_id))

    respond_to do |format|
      if @event.save
        # Menu
        menu = Menu.find(event_params[:menu_id])

        menu.menu_items.each do |item|
          EventItem.create!(item_id: item.id, event_id: @event.id, supplier_id: event_params[:supplier_id], quantity: event_params[:attendees])
        end

        # Decor
        decor = Decor.find(event_params[:decor_id])

        decor.decor_items.each do |item|
          EventItem.create!(item_id: item.id, event_id: @event.id, supplier_id: event_params[:supplier_id], quantity: event_params[:decor_count])
        end

        # Ent
        ent = Ent.find(event_params[:ent_id])

        ent.ent_items.each do |item|
          EventItem.create!(item_id: item.id, event_id: @event.id, supplier_id: event_params[:supplier_id], quantity: event_params[:ent_count])
        end

        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params.except(:decor_count, :ent_count, :supplier_id))
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:client_id, :venue_id, :menu_id, :decor_id, :ent_id, :attendees, :date, :decor_count, :ent_count, :supplier_id)
    end
end
