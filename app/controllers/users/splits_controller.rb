class Users::SplitsController < ApplicationController
  before_action :get_product
  before_action :set_split, only: %i[ show edit update destroy ]

  # GET /splits or /splits.json
  def index
    @splits = @product.splits
  end

  # GET /splits/1 or /splits/1.json
  def show
  end

  # GET /splits/new
  def new
    @split = @product.splits.new
  end

  # GET /splits/1/edit
  def edit
  end

  # POST /splits or /splits.json
  def create
    @split = Split.new(split_params)
   
 
    respond_to do |format|
      if @split.save
        format.html { redirect_to product_split_url(@product, @split), notice: "Split was successfully created." }
        format.json { render :show, status: :created, location: @split }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @split.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /splits/1 or /splits/1.json
  def update
    respond_to do |format|
      if @split.update(split_params)
        format.html { redirect_to split_url(@split), notice: "Split was successfully updated." }
        format.json { render :show, status: :ok, location: @split }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @split.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /splits/1 or /splits/1.json
  def destroy
    @split.destroy

    respond_to do |format|
      format.html { redirect_to product_splits_url, notice: "Split was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_product
      @product = Product.find(params[:product_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_split
      @split = @product.splits.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def split_params
      params.require(:split).permit(:account, :split_percent, :product_id, :split_total)
    end
end
