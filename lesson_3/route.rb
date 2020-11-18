class Route
  attr_reader :stations, :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    
  end

  def add_stations(interim)
    @stations.insert(-2, interim)  #insert вставляет элемент предпоследним элементом
  end

  def delete_station(interim)
    @stations.delete(interim)
  end
end
