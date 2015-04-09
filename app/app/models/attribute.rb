class Attribute < ActiveRecord::Base
	self.table_name = 'ORACLEMASTER.ATTRIBUTES'
  attr_accessible :attribute_id, :attribute_name
end
