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
    if @train_route.stations.index(@current_station) + 1 < @train_route.stations.length
      @train_route.stations.index(@current_station) + 1 
      @current_station.send_train(self)
      next_station.get_train(self)
      @current_station = @train_route.stations[@train_route.stations.index(@current_station) + 1]
    else
      puts 'Поезд на последней станции, движенеи дальше не возможно'
    end  
  end

  def backward    
    if @train_route.stations.index(@current_station) > 0
      @train_route.stations.index(@current_station) - 1 
      @current_station.send_train(self)
      early_station.get_train(self)
      @current_station = @train_route.stations[@train_route.stations.index(@current_station) - 1]
    else
      puts 'Поезд на первой станции, движение назад не возможно!'
    end
  end

  def next_station
    @train_route.stations[@train_route.stations.index(@current_station) + 1]
  end

  def early_station
    @train_route.stations[@train_route.stations.index(@current_station) - 1]
  end
end