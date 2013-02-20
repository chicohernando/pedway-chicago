class Location < ActiveRecord::Base
  attr_accessible :name, :yelp_id, :number_of_reviews, :phone_number, :is_closed,
                  :address, :city, :state, :zip_code, :latitude, :longitude

  validates :name, length: { in: 1..70 }

  def self.order_by_name
    Location.order('name asc')
  end
end
