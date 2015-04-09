class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.integer :attribute_id
      t.text :attribute_name

      t.timestamps
    end
  end
end
