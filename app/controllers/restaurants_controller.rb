class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new

    if params[:full_address].present?
      @restuarant = Restaurant.near(params[:full_address])
    else
      @restaurant = Restaurant.all
    end
  
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
 
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # GET /restaurants/search
  def search
    @restaurant = Restaurant.new

    if params[:address].present?
      @restaurant = Restaurant.near(params[:address], params[:distance] || 10, order: :distance)
    else
      @restaurant = Restaurant.all
    end


    @coord = Geocoder.coordinates(params[:address])
    puts "#"*1000
    puts @coord
    puts params[:address]
    puts "#"*1000
    distance = params[:distance].to_f / 0.00062137

    @client = GooglePlaces::Client.new('AIzaSyCnGw9inAh1ze8rVfRoDT1QdsEwypfjxz0')
    #@spot = @client.spots(32.815719, -96.783268, :types => 'restaurant', :exclude => 'meal_takeaway', :radius => 5000)
    @spot = @client.spots(@coord[0], @coord[1], :types => 'restaurant', :exclude => 'meal_takeaway', :radius => distance)
    @place = @spot.sample
    @specific_place = @place.name
    @photo_id = @place.reference
    @address = @place.address_components
    if @place.photos.empty?
      @url = nil
    else
      @url = @place.photos[0].fetch_url(600)
    end

    # @detailed_info = @client.spot(@place[:reference])

  
  end

  # POST /restaurants
  # POST /restaurants.json
 

  def create

    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone, :hours, :food_type_id, :integer, :latitude, :longitude)
    end

end
