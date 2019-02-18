class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    # @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    # GET /restaurants/new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @cocktail.update(cocktail_params)
        redirect_to cocktail_path(@cocktail)
      else
        render :edit
      end
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

  # def create
  #   @cocktail = Cocktail.create(cocktail_params)
  #   if @cocktail.save#     redirect_to cocktail_path(@cocktail)
  #   else
  #     render "new"
  #   end
  # end

  # def edit          # GET /restaurants/:id/edit
  # end

  # def update        # PATCH /restaurants/:id
  # end

