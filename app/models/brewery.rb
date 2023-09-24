class Brewery < ApplicationRecord
  include RatingAverage

  validates :name, presence: true
  validates :year, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1040 }

  validate :year_cannot_be_greater_than_current

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  private

  def year_cannot_be_greater_than_current
    return unless year.present? && year > Date.today.year

    errors.add(:year, "cannot be greater than current year #{Date.today.year}")
  end
end
