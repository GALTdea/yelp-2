class Business < ActiveRecord::Base
	self.table_name = 'oraclemaster.businesses'
  attr_accessible :business_id, :city, :full_address, :latitude, :longitude, :name, :state, :region, :rating

  has_many :businesscategories, :foreign_key  => "business_id"
  has_many :categories, through: :businesscategories

  has_many :businessattributes, :foreign_key  => "business_id"
  has_many :zattributes, through: :businessattributes

  has_many :reviews, :foreign_key  => "business_id"
before_validation :set_rating
 def set_rating
    return self.rating = 1
  end

end
