class FlatsController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      begin
        @flats = Flat.where("LOWER(name) LIKE ?", "%#{@query}%")
      rescue
        ActiveRecord::StatementInvalid
        @flats = Flat.none
      end
    else
      @flats = Flat.all
    end
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
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_flat
  end

  def update
    find_flat
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
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
