class Business < ActiveRecord::Base
	self.table_name = 'oraclemaster.businesses'
  attr_accessible :business_id, :city, :full_address, :latitude, :longitude, :name, :state

  has_many :businesscategories
  has_many :categories, through :businesscategories
end
