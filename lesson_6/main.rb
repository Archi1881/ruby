require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

@trains = []
@stations = []
@routes = []
@wagons = []

def menu
  loop do
    puts 'Меню: '
    puts '1. Создать станцию'
    puts '2. Создать поезд'
    puts '3. Создать и редактировать маршрут'
    puts '4. Назначать маршрут поезду'
    puts '5. Добавлять или оцеплять вагоны оот поезда'
    puts '6. Перемещать поезд по маршруту'
    puts '7. Список станции и список поездов на станции'
    puts '0. выход'
    print 'Введите номер меню: '
    case menu_iteam = gets.chomp.to_i
    when 1
      create_station
    when 2
      create_train
    when 3
      manage_route
    when 4
      assign_route
    when 5
      manage_wagon
    when 6
      send_train
    when 7
      list_stations
    when 0
      exit
    else 
      puts'Выберите пункт из меню'
    end
  end
end

def create_train
  puts "Создание поезда"
  print 'Введите название поезда: '
  number = gets.chomp
  select_type
  if @type == :cargo
    @trains <<(CargoTrain.new number)
    puts "Создан поезд #{number} - грузовой"
  else
     @trains <<(PassengerTrain.new number)
     puts "Создан поезд #{number} - пассажирский"
  end
end

def select_type
  @type = nil
  loop do
    puts "Типы: "
    puts "1.Грузовой"
    puts "2. Пассажирский"
    print 'Выбирите тип поезда: '
    @type = gets.chomp.to_i
    case @type
    when 1
      @type = :cargo
    when 2
      @type = :passenger
    else
      puts "Выбирите тип поезда"
    end
  break if @type == :cargo || @type == :passenger
  end
end

def create_station
  name = nil
  puts "Создание станции"
  print 'Введите название станции: '
  name = gets.chomp
  @stations <<(Station.new name)
  puts "Создана станция #{name}"
end

def manage_route
  menu_iteam = nil
  @item_route = nil
  name = nil
  first_station = nil
  list_station = nil
  loop do
    puts "Управление маршрутами"
    puts "1. Создать маршрут"
    puts "2. Редактировать маршрут"
    puts "3. Вернуться в главное меню"
    print 'Выберите пункт меню: '
    menu_iteam = gets.chomp.to_i
    case menu_iteam
    when 1
      create_route
    when 2
      edit_route
    when 3
      menu_iteam
    else
      puts "Выберите каккой-нибудь пункт"
    end
  end
end

def create_route
  puts "Создать маршрут."
  print 'Введите название маршрута: '
  name = gets.chomp.to_i
  puts "Список станции: "
  list_stations
  print 'Выберите номер начальной станции: '
  first_station = @stations[first_station-1]
  puts "начальная станция #{first_station.name}"

  list_stations
  print'Выберите номер конечной станции: '
  last_station = gets.chomp.to_i
  last_station = @stations[last_station-1]
  puts "конечная станция #{last_station.name}"
  @routes <<(Route.new name first_station, last_station)
  puts "Создан маршрут #{name} - начальная станция #{first_station}, и конечной станцией - #{last_station}"
end

def edit_route
  puts "Редактирование маршрута"
  puts "Список маршрутов для редактирования: "
  list_route
  @item_route = gets.chomp.to_i
  @route = @routes[@item_route-1]
  loop do
    puts "1. Добавить станцию в маршрут #{@route}"
    puts "2. Удалить станцию из маршрута #{@route}"
    puts "3. Вернуться в предыдущее меню"
    puts "4. Вернуться  в главное меню"
    menu_item = gets.chomp.to_i
    case menu_item
    when 1
      route_add_station
    when 2
      route_delete_station
    when 3
      manage_route
    when 4
      menu
    else
      puts "Выберите какой-нибудь пункт"
    end
  end
end

def route_add_station
  puts "Добавления станций в маршрут #{@route}"
  puts "Список станций для добавления в маршрут: "
  list_stations
  print 'Введите номер станции для дбавления в маршрут: '
  station = gets.chomp.to_i
  station = @stations[station-1]
  @route.add_stations(station)
  puts "Список станций на маршруте #{@route}"
  puts "#{@route.stations}"
end

def route_delete_station
  puts "Удаление станций из маршрута #{@route}"
  list_route
  print 'Введите номер станций для удаления из маршрута: '
  station = gets.chomp.to_i
  station = @route.stations[station-1]
  puts station.name
  @route.delete_stations(station)
  puts "Список станций на маршруте #{@route}"
  puts "#{@route.stations}"
end

def list_stations
  @stations.each.with_index do |station, index|
    puts "#{index+1}. #{@stations[index]} - #{@stations[index].name}"
  end
end

def list_route
  @routes.each.with_index do |route,index|
    puts "#{index+1}. #{@routes[index]} - #{@routes[index].stations}"
  end  
end

def list_trains
  @trains.each.with_index do |train, index|
    puts "#{index+1}.  Поезд #{@trains[index].number} - #{@trains[index].type}"
  end
end

def assign_route
  train = nil
  puts "Добавление маршрута поезду"
  puts "Список поездов: "
  list_trains
  print 'Выберите поезд для добавления маршрута: '
  train = gets.chomp.to_i
  @train = @trains[train-1]
  puts "Список маршрутов: "
  list_route
  print 'Выберите номер маршрута для добавления поезду #{@train.number}: '
  @iteam_route = gets.chomp.to_i
  @route = @routes[@iteam_route-1]
  if @train.train_route.nil?
    @train.get_route(@route)
    puts "Поезду #{@train.number} добавлен маршрут #{@route}"
  else 
    puts "У поезда#{@train.number} есть такой маршрут#{@train.train_route}!"
  end
end

def manage_wagon
  wagon_iteam = nil
  loop do
    puts "Управление вагонами"
    puts "1. Создать вагон"
    puts "2. Прицепить вагон"
    puts "3. Отцепить вагон"
    puts "4. Вернуться в главное меню"
    print 'Выберите номер меню: '
    wagon_iteam = gets.chomp.to_i
    case wagon_iteam
    when 1
      create_wagon
    when 2 
      hook_wagon
    when 3
      unhook_wagon
    when 4
        menu
    else
      puts "Выбирите каккой-нибудь пункт"
    end
  end
end

def create_wagon
  puts "Создание вагона"
  select_type
  if @type == :cargo
    @wagons << (CargoWagon.new @type)
  else 
    @wagons << (PassengerWagon.new @type)
  end
  puts "Создан вагон #{@type}"
end

def hook_wagon
  puts "Прицепление вагона к поезду"
  puts "Список вагонов: "
  list_wagons
  print "Выбери вагон: "
  wagon = gets.chomp.to_i
  wagon = @wagons[wagon-1]
  puts "Выбран вагон #{wagon}"
  
  list_trains
  print 'Выберите поезд к которому прицепить вагон: '
  train = gets.chomp.to_i
  train = @trains[train-1]
  if wagon.current_train == nil
    if train.type == wagon.type
      train.add_wagon(wagon)
      wagon.get_current_train(train)
      puts "Вагон #{wagon} прицеплен к поезду #{train}"
      puts train.all_wagons
    else puts "Поезд #{train.type} и вагон #{wagon.type} несовместимы."
    end
  else puts "Вагон уже прицеплин к поезду #{wagon.current_train}"
  end
end

def unhook_wagon
  puts "Отцепление вагона от поезда"
  puts "Список вагонов: "
  list_wagons
  print 'Выберите вагон: '
  wagon = gets.chomp.to_i
  wagon = @wagons[wagon-1]
  puts "Выбран вагон #{wagon}"
  @trains.each do |train|
    if train.all_wagons.include?(wagon)
      wagon.del_current_train
      train.delete_wagon(wagon)
    puts "Вагон #{wagon} отцеплен от поезда #{train}"
    end
  end  
end

def send_train
  puts "Движение поезда по маршруту"
  list_trains
  print 'Выбериет поезд для движения по маршруту: '
  train = gets.chomp.to_i
  train = @trains[train-1]
  puts "Маршрут поезда #{train} - #{train.train_route}"
  puts "Текущая станция #{train.current_station.name}"
  loop do 
    puts "1. Дижение поезда вперед"
    puts "2. Движение поезда назад"
    puts "3. выход"
    print 'Выберите следующее действие: '
    move_iteam = gets.chomp.to_i
    case move_iteam
    when 1
      train.move_forward
      puts "Предыдущае станция - #{train.previous_station.name}" if train.previous_station != nil
      puts "Текущая станция - #{train.current_station.name}"
      puts "Следующая станция - #{train.next_station.name}" if train.next_station != nil
    when 2
      train.move_back
      puts "Предыдущае станция - #{train.previous_station.name}" if train.previous_station != nil
      puts "Текущая станция - #{train.current_station.name}"
      puts "Следующая станция - #{train.next_station.name}" if train.next_station != nil
    when 3
      menu
    else 
      puts 'Выберите каккой-нибудь пункт!'
    end
  end
end

def list_wagons
  @wagons.each.with_index do |train, index|
    puts "#{index+1}.Вагон #{@wagons[index].type}"
  end   
end

def list_stations_trains
  puts "Список станций"
  list_stations
  print 'Введите номер станции для просмотра: '
  st = gets.comp.to_i
  st = @stations[st-1]
  print "На станции #{st.name} находится поезда: "
  st.all_trains.each { |at| print at, ""}
  puts
end

def seed
  @trains << (train1 = CargoTrain.new 1)
  @trains << (train2 = PassengerTrain.new 2)
  @trains << (train3 = CargoTrain.new 3)
  @trains << (train4 = PassengerTrain.new 4)
  @stations << (station_1 = Station.new 'first')
  @stations << (station_2 = Station.new 'second')
  @stations << (station_3 = Station.new 'middle')
  @stations << (station_4 = Station.new 'center')
  @stations << (station_5 = Station.new 'five')
  @stations << (station_6 = Station.new 'last')
  @routes << (route_1 = Route.new station_1, station_6)
  @routes << (route_2 = Route.new station_3, station_6)
end

seed
menu