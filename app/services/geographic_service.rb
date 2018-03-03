class GeographicService
  def self.get_nearby(lat, lng, distance, bearing)
    GeographicLib::Geodesic::WGS84.direct(lat, lng, bearing, false, distance) 
  end

  def self.find_all_points(lat, lng, interval_distance, rings)
    # Get initial ring (NESW) values at interval_distance away from initial lat/lon
    north = get_nearby(lat, lng, interval_distance, 0)  
    east = get_nearby(lat, lng, interval_distance, 90)
    south = get_nearby(lat, lng, interval_distance, 180)
    west = get_nearby(lat, lng, interval_distance, 270)
    results = {0 => {0 => [north, east, south, west]}}
    all_points = []

    i = 0
    while i < rings - 1 do
      inner_loop_count = 0
      results[i].each_value do |inner_points|
          next_index = i + 1
        inner_points.each do |point| 
          lat = point[:lat2]
          lng = point[:lon2]
          results[next_index] ||= {}
          results[next_index][inner_loop_count] = []
          [0, 90, 180, 270].each do |bearing|
            nearby_point = get_nearby(lat, lng, interval_distance, bearing)
            results[next_index][inner_loop_count].push(nearby_point) # unless nearby_point[:lat1] == nearby_point[:lat2] && nearby_point[:lon1] == nearby_point[:lon2]
            all_points.push(nearby_point)
          end
          inner_loop_count += 1
        end
      end
      i += 1
    end
    all_points.uniq
  end
end
