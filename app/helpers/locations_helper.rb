module LocationsHelper

  def static_map(latitude, longitude)
    image_tag("https://maps.googleapis.com/maps/api/staticmap?center=#{latitude},#{longitude}&zoom=15&size=300x300&sensor=false&markers=color:green|#{latitude},#{longitude}")
  end

end
