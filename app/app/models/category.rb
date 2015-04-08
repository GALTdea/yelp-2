class Category < ActiveRecord::Base
	self.table_name = 'ORACLEMASTER.CATEGORIES'
  attr_accessible :category_id, :name
end
