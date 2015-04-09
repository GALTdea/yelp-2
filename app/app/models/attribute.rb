class Attribute < ActiveRecord::Base
	self.table_name = 'ORACLEMASTER.ATTRIBUTES'
  attr_accessible :attribute_id, :attribute_name

    has_many :businessattributes, :foreign_key  => "attribute_id"
  has_many :businesses, through: :businessattributes
end
