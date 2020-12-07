class Train

  NUMBER_FORMAT = /\w{3}-*\w{2}/

  attr_accessor :speed
  attr_reader :number, :all_wagons, :train_route, :current_station_index
                                                                     
  def initialize(number)
    @number = number
    @all_wagons = []
    @speed = 0
    @train_route = nil
    @current_station_index = nil
    validate!
  end

  def add_wagon(wagon)
      @all_wagons << wagon if @speed == 0 
  end

  def delete_wagon(wagon)
    @all_wagons.delete(wagon) if @speed == 0
  end
  
  def get_route(route)
    @current_station_index = 0
    @train_route = route
    @train_route.first_station.get_train(self)
  end

  def current_station
    @train_route.stations[@current_station_index]
  end

  def next_station
    @train_route.stations[@current_station_index + 1] if next?
  end

  def previous_station
    @train_route.stations[@current_station_index - 1] if previous?
  end
  
  def move_forward
    if next?   
      @current_station_index += 1
      @train_route.stations[@current_station_index - 1].send_train(self)
      @train_route.stations[@current_station_index].get_train(self)
    end
    return  current_station
  end
  
  def move_back
    if previous?
      @current_station_index -= 1
      @train_route.stations[@current_station_index + 1].send_train(self)
      @train_route.stations[@current_station_index].get_train(self)
    end
    return current_station
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    raise "Номер поезда должен содержать не менее трех цифр" if number.length < 4
    raise "Введите правильно номер" if number !~ NUMBER_FORMAT
  end

  def next?
    @current_station_index + 1 < @train_route.stations.length
  end
0
  def previous?
    @current_station_index > 0
  end
end
