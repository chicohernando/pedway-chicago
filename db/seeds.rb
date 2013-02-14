# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read('/Users/carissaniederer/projects/pedway-chicago/db/locations.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  row = row.to_hash.with_indifferent_access
  client = Yelp::Client.new
  request = Yelp::V2::Business::Request::Id.new(:yelp_business_id => row[:yelp_id], :consumer_key => 'ySTAqT-KQEr58AncKSBYEA',:consumer_secret => 'Q5yKPXoe7dAUkmk1JW0vkt8sPoE',:token => 'owxAUr4AoUHzr98T8HBN10c2Vhvk4dfS',:token_secret => 'JplYYfgKmVBN7XPucl9ytuex7TY')
  response = client.search(request)
  puts response["url"]
  Location.create!(
    :name => response["name"],
    :yelp_id => response["id"],
    :number_of_reviews => response["review_count"],
    :phone_number => response["phone"],
    :is_closed => response["is_closed"],
    :address => response["location"]["address"][0],
    :city => response["location"]["city"],
    :state => response["location"]["state_code"],
    :zip_code => response["location"]["postal_code"],
    :latitude => response["location"]["coordinate"]["latitude"],
    :longitude => response["location"]["coordinate"]["longitude"]
    )
end