class CreateBusinesscategories < ActiveRecord::Migration
  def change
    create_table :businesscategories do |t|
      t.text :business_id
      t.integer :category_id

      t.timestamps
    end
  end
end
