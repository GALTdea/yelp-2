class CreateTestTable < ActiveRecord::Migration
  def change
    create_table :test_records, primary_key_trigger: true do |t|
      t.timestamps
    end
  end
end