class InstagramPost < ApplicationRecord
  belongs_to :curator, class_name: 'User'
  belongs_to :reviewer, class_name: 'User', optional: true
  has_many :reviews, class_name: 'Review', as: :reviewable
end
