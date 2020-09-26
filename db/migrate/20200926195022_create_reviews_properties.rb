class CreateReviewsProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews_properties do |t|
      t.belongs_to :review
      t.belongs_to :property
    end
  end
end
