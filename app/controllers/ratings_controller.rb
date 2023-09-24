class RatingsController < ApplicationController
  before_action :set_rating, only: %i[destroy]

  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.create(rating_params)
    @rating.user = current_user

    if @rating.save
      redirect_to current_user
    else
      @beers = Beer.all
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @rating.user_id == current_user.id
      @rating.delete
    end
    redirect_to ratings_path
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :beer_id)
  end

  def set_rating
    @rating = Rating.find(params[:id])
  end
end
