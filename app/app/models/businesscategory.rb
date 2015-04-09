class Businesscategory < ActiveRecord::Base
	self.table_name = 'ORACLEMASTER.BUSINESSCATEGORIES'
  attr_accessible :business_id, :category_id

  belongs_to :businesses
  belongs_to :categories
end
