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
    rating = Rating.create(rating_params)

    # save the rating to a session
    session[:last_rating] = "#{rating.beer.name} #{rating.score} points"

    redirect_to ratings_path
  end

  def destroy
    @rating.delete
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
