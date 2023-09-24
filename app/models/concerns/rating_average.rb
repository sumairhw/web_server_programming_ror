module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    return 0 if ratings.count == 0

    (ratings.sum(:score) / ratings.count).to_f
  end
end
