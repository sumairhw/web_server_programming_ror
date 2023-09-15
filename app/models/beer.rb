class Beer < ApplicationRecord
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  def average_rating
    (ratings.sum(:score) / ratings.count).to_f
  end

  def to_s
    "#{brewery.name} #{name}"
  end
end
