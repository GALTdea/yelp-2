class Business < ActiveRecord::Base
	self.table_name = 'oraclemaster.businesses'
  attr_accessible :business_id, :city, :full_address, :latitude, :longitude, :name, :state

  has_many :businesscategories, :foreign_key  => "business_id"
  has_many :categories, through: :businesscategories

  has_many :businessattributes, :foreign_key  => "business_id"
  has_many :attributes, through: :businessattributes

  has_many :reviews, :foreign_key  => "business_id"
end
