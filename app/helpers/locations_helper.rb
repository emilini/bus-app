module LocationsHelper

  # gets all the buses from teh MARTA Api
  def fetch_every_bus_in_atlanta(atlanta_bus_api_url)
    full_http_response = Net::HTTP.get_response(URI.parse(atlanta_bus_api_url))
    all_the_bus_data = full_http_response.body

    JSON.parse(all_the_bus_data)
    end
  # fetch

  # decide which buses are close to the user
  def is_close_enough?(user_lat, user_long, bus_lat, bus_long)
    # what is closer enough?
    max_distance = 0.01
    # how far away is that bus?
    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f

    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
    # the bus is close enough: true or false

    distance <= max_distance
  end

end
# locationshelper
