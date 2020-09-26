class ReviewsProperties < ApplicationRecord
  belongs_to :review
  belongs_to :property
end
