class CouriersController < ApplicationController
  before_action :set_courier, only: [:show, :edit, :update, :destroy]

  def index
    @couriers = Courier.all
  end

  def show
  end

  def new
    @courier = Courier.new
  end

  def edit
  end

  def create
    @courier = Courier.new(courier_params)

    respond_to do |format|
      if @courier.save
        format.html { redirect_to @courier, notice: 'Successfully created!' }
        format.json { render :show, status: :created, location: @courier }
      else
        format.html { render :new }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @courier.update(courier_params)
        format.html { redirect_to @courier, notice: 'Successfully updated!' }
        format.json { render :show, status: :ok, location: @courier }
      else
        format.html { render :edit }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @courier.destroy
    respond_to do |format|
      format.html { redirect_to couriers_url, notice: 'Successfully deleted!' }
      format.json { head :no_content }
    end
  end

  private

  def set_courier
    @courier = Courier.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(:name, :email)
  end
end
