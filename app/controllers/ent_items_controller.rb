class EntItemsController < ApplicationController
  before_action :set_ent_item, only: [:show, :edit, :update, :destroy]

  # GET /ent_items
  # GET /ent_items.json
  def index
    @ent_items = EntItem.all
  end

  # GET /ent_items/1
  # GET /ent_items/1.json
  def show
  end

  # GET /ent_items/new
  def new
    @ent_item = EntItem.new
  end

  # GET /ent_items/1/edit
  def edit
  end

  # POST /ent_items
  # POST /ent_items.json
  def create
    @ent_item = EntItem.new(ent_item_params)

    respond_to do |format|
      if @ent_item.save
        format.html { redirect_to @ent_item, notice: 'Ent item was successfully created.' }
        format.json { render :show, status: :created, location: @ent_item }
      else
        format.html { render :new }
        format.json { render json: @ent_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ent_items/1
  # PATCH/PUT /ent_items/1.json
  def update
    respond_to do |format|
      if @ent_item.update(ent_item_params)
        format.html { redirect_to @ent_item, notice: 'Ent item was successfully updated.' }
        format.json { render :show, status: :ok, location: @ent_item }
      else
        format.html { render :edit }
        format.json { render json: @ent_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ent_items/1
  # DELETE /ent_items/1.json
  def destroy
    @ent_item.destroy
    respond_to do |format|
      format.html { redirect_to ent_items_url, notice: 'Ent item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ent_item
      @ent_item = EntItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ent_item_params
      params.require(:ent_item).permit(:ent_id, :item_id, :quantity, :ord)
    end
end
