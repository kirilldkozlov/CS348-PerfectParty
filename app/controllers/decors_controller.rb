class DecorsController < ApplicationController
  before_action :set_decor, only: [:show, :edit, :update, :destroy]

  # GET /decors
  # GET /decors.json
  def index
    @decors = Decor.all
  end

  # GET /decors/1
  # GET /decors/1.json
  def show
  end

  # GET /decors/new
  def new
    @decor = Decor.new
  end

  # GET /decors/1/edit
  def edit
  end

  # POST /decors
  # POST /decors.json
  def create
    @decor = Decor.new(decor_params)

    respond_to do |format|
      if @decor.save
        format.html { redirect_to @decor, notice: 'Decor was successfully created.' }
        format.json { render :show, status: :created, location: @decor }
      else
        format.html { render :new }
        format.json { render json: @decor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decors/1
  # PATCH/PUT /decors/1.json
  def update
    respond_to do |format|
      if @decor.update(decor_params)
        format.html { redirect_to @decor, notice: 'Decor was successfully updated.' }
        format.json { render :show, status: :ok, location: @decor }
      else
        format.html { render :edit }
        format.json { render json: @decor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decors/1
  # DELETE /decors/1.json
  def destroy
    @decor.destroy
    respond_to do |format|
      format.html { redirect_to decors_url, notice: 'Decor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decor
      @decor = Decor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decor_params
      params.require(:decor)
    end
end
