class Business < ActiveRecord::Base
	self.table_name = 'oraclemaster.businesses'
  attr_accessible :business_id, :city, :full_address, :latitude, :longitude, :name, :state
end
