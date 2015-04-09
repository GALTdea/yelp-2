class Businessattribute < ActiveRecord::Base
	self.table_name = 'ORACLEMASTER.BUSINESSATTRIBUTES'
  attr_accessible :attribute_id, :business_id
end
