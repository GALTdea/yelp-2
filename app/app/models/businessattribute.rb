class Businessattribute < ActiveRecord::Base
	self.table_name = 'ORACLEMASTER.BUSINESSATTRIBUTES'
  attr_accessible :attribute_id, :business_id

  belongs_to :business, :foreign_key => "business_id"
  belongs_to :zattribute, :foreign_key => "attribute_id"

end
