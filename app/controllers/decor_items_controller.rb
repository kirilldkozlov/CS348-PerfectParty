class DecorItemsController < ApplicationController
  before_action :set_decor_item, only: [:show, :edit, :update, :destroy]

  # GET /decor_items
  # GET /decor_items.json
  def index
    @decor_items = DecorItem.all
  end

  # GET /decor_items/1
  # GET /decor_items/1.json
  def show
  end

  # GET /decor_items/new
  def new
    @decor_item = DecorItem.new
  end

  # GET /decor_items/1/edit
  def edit
  end

  # POST /decor_items
  # POST /decor_items.json
  def create
    @decor_item = DecorItem.new(decor_item_params)

    respond_to do |format|
      if @decor_item.save
        format.html { redirect_to @decor_item, notice: 'Decor item was successfully created.' }
        format.json { render :show, status: :created, location: @decor_item }
      else
        format.html { render :new }
        format.json { render json: @decor_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decor_items/1
  # PATCH/PUT /decor_items/1.json
  def update
    respond_to do |format|
      if @decor_item.update(decor_item_params)
        format.html { redirect_to @decor_item, notice: 'Decor item was successfully updated.' }
        format.json { render :show, status: :ok, location: @decor_item }
      else
        format.html { render :edit }
        format.json { render json: @decor_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decor_items/1
  # DELETE /decor_items/1.json
  def destroy
    @decor_item.destroy
    respond_to do |format|
      format.html { redirect_to decor_items_url, notice: 'Decor item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decor_item
      @decor_item = DecorItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decor_item_params
      params.require(:decor_item).permit(:id, :decor_id, :item_id, :quantity)
    end
end
