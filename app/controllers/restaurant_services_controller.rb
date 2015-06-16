class RestaurantServicesController < ApplicationController
  before_action :set_restaurant_service, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin
  # GET /restaurant_services
  # GET /restaurant_services.json
  def index
    @restaurant_services = RestaurantService.all
  end

  # GET /restaurant_services/1
  # GET /restaurant_services/1.json
  def show
  end

  # GET /restaurant_services/new
  def new
    @restaurant_service = RestaurantService.new
  end

  # GET /restaurant_services/1/edit
  def edit
  end

  # POST /restaurant_services
  # POST /restaurant_services.json
  def create
    @restaurant_service = RestaurantService.new(restaurant_service_params)

    respond_to do |format|
      if @restaurant_service.save
        format.html { redirect_to @restaurant_service, notice: 'Restaurant service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_services/1
  # PATCH/PUT /restaurant_services/1.json
  def update
    respond_to do |format|
      if @restaurant_service.update(restaurant_service_params)
        format.html { redirect_to @restaurant_service, notice: 'Restaurant service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_services/1
  # DELETE /restaurant_services/1.json
  def destroy
    @restaurant_service.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_service
      @restaurant_service = RestaurantService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_service_params
      params.require(:restaurant_service).permit(:restaurant_id, :service_id, :url)
    end

    def admin
      redirect_to root_path unless current_user.admin == true
    end
end
