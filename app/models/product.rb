class Product < ActiveRecord::Base

	validates_numericality_of :price, greater_than: 0

end

