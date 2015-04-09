class CreateBusinessattributes < ActiveRecord::Migration
  def change
    create_table :businessattributes do |t|
      t.text :business_id
      t.integer :attribute_id

      t.timestamps
    end
  end
end
