class ReviewsProperties < ApplicationRecord
  belongs_to :review
  belongs_to :property

  default_scope { includes(:property).order("properties.id") }

  def unicode_text
    return nil if value == 0

    "#{property.name}: \t #{'★' * value}#{'☆' * (5-value)}"
  end
end
