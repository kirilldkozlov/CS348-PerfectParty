class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @rating = params[:rating] || ""

    @suppliers = if params[:rating].blank?
        Supplier.find_by_sql("
          SELECT s.*, avg(ratings.score) AS avg_rating
            FROM suppliers AS s
            INNER JOIN ratings ON ( s.id = ratings.supplier_id )
            GROUP BY s.id
          UNION
          SELECT s.*, NULL as placeholder
            FROM suppliers AS s
            LEFT OUTER JOIN ratings ON ( s.id = ratings.supplier_id )
            WHERE (ratings.supplier_id is NULL)
          ORDER BY id;
          ")
      else
        Supplier.find_by_sql(["
        SELECT *
          	FROM (
          	SELECT s.*, avg(ratings.score) AS avg_rating
          	FROM suppliers AS s
          	INNER JOIN ratings ON ( s.id = ratings.supplier_id )
            GROUP BY s.id
          ) AS supllier_ratings
          WHERE supllier_ratings.avg_rating >= ?
          ORDER BY supllier_ratings.id;
          ", params[:rating]])
      end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to(suppliers_path, notice: 'Supplier added.') }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to(suppliers_path, notice: 'Supplier removed.')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:first_name, :last_name, :telephone, :events_supplied)
    end
end
