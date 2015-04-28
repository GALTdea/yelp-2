class Region < ActiveRecord::Base
  self.table_name = 'ORACLEMASTER.REGIONS'
  attr_accessible :region
end
