class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :review_text
      t.belongs_to :reviewer
      t.belongs_to :content
      t.timestamps
    end
  end
end
