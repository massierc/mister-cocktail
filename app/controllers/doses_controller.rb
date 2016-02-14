class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
    @dose.save ? redirect_to cocktail_path(@cocktail) : render :new
  end

  def destroy
    cocktail = Cocktail.find(params[:cocktail_id])
    Dose.find(params[:id]).destroy if Dose.exists?(params[:id])
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
