class Train
  attr_reader :count_wagon, :speed, :type, :train_route, :current_station, :current_station_index

  def initialize(number, type, count_wagon,)
    @number = number
    @type = type
    @count_van = count_van
    @speed = 0
    @train_route = nil
    @current_station = nil
    @current_station_index = nil
  end

  def go(speed) 
    @speed = speed
  end

  def current_speed  
    @speed 
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
    @current_station_index = 0
    @train_route = route
    @train_route.first_station.get_train(self)
  end

  def current_station
    @train_route.stations[@current_station_index]
  end

  def forward
    if @current_station_index + 1 < @train_route.stations.length
      @current_station_index += 1
      current_station.send_train(self)
      next_station.get_train(self)
    else
      puts 'Поезд на последней станции, движенеи дальше не возможно'
    end  
  end

  def backward
    if @current_station_index > 0
      @current_station_index -= 1
      current_station.send_train(self)
      early_station.get_train(self)
    else
      puts 'Поезд на первой станции, движение назад не возможно!'
    end
  end

  def next_station
    @train_route.station[@current_station_index + 1]
  end

  def early_station
    @train_route.station[@current_station_index - 1]
  end
end


