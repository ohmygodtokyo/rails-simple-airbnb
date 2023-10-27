class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    find_flat
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path(@flats)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_flat
  end

  # Don't forget to change the redirect_to from 'flats_path(@flats)' to 'flat_path(@flat)'

  def update
    find_flat
    if @flat.update(flat_params)
      redirect_to flats_path(@flats)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_flat
    @flat.destroy
    redirect_to flats_path(@flats), status: :see_other
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guest)
  end
end
