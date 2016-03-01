class FoodTypesController < ApplicationController
  before_action :set_food_type, only: [:show, :edit, :update, :destroy]

  # GET /food_types
  # GET /food_types.json
  def index
    @food_types = FoodType.all
  end

  # GET /food_types/1
  # GET /food_types/1.json
  def show
  end

  # GET /food_types/new
  def new
    @food_type = FoodType.new
  end

  # GET /food_types/1/edit
  def edit
  end

  # POST /food_types
  # POST /food_types.json
  def create
    @food_type = FoodType.new(food_type_params)

    respond_to do |format|
      if @food_type.save
        format.html { redirect_to @food_type, notice: 'Food type was successfully created.' }
        format.json { render :show, status: :created, location: @food_type }
      else
        format.html { render :new }
        format.json { render json: @food_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_types/1
  # PATCH/PUT /food_types/1.json
  def update
    respond_to do |format|
      if @food_type.update(food_type_params)
        format.html { redirect_to @food_type, notice: 'Food type was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_type }
      else
        format.html { render :edit }
        format.json { render json: @food_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_types/1
  # DELETE /food_types/1.json
  def destroy
    @food_type.destroy
    respond_to do |format|
      format.html { redirect_to food_types_url, notice: 'Food type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_type
      @food_type = FoodType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_type_params
      params.require(:food_type).permit(:name)
    end
end
