class Train
  attr_reader :count_wagon, :speed, :type, :train_route, :current_station

  def initialize(number, type, count_wagon)
    @number = number
    @type = type
    @count_wagon = count_wagon
    @speed = 0
  end

  def go(speed) 
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagon    
     @count_wagon += 1 if speed == 0
  end

  def delete_wagon 
    if @count_wagon >= 2 && speed == 0
      @count_wagon -= 1
    end
  end

  def get_route(route)
    @current_station = route.first_station
    route.stations.index(@current_station)
    @train_route = route
    @train_route.first_station.get_train(self)
  end
  
  def forward
    return unless next_station

    @current_station.send_train(self)
    @current_station = next_station
    @current_station.get_train(self)
  end

  def backward    
    return unless previous_station
    
    @current_station.send_train(self)
    @current_station = previous_station
    @current_station.get_train(self)
  end

  def next_station
    @train_route.stations[@train_route.stations.index(@current_station) + 1]
  end

  def previous_station
    @train_route.stations[@train_route.stations.index(@current_station) - 1]
  end
end