class Businesscategory < ActiveRecord::Base
	self.table_name = 'ORACLEMASTER.BUSINESSCATEGORIES'
  attr_accessible :business_id, :category_id

  belongs_to :businesses, :foreign_key => "business_id"
  belongs_to :categories, :foreign_key => "category_id"
end
