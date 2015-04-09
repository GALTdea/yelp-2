class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :review_id
      t.text :business_id
      t.float :stars
      t.text :text
      t.date :review_date

      t.timestamps
    end
  end
end
