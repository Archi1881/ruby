class Station
 
  attr_reader :name, :trains, :cargo, :passenger
  
  def initialize(name)
    @name = name
    @trains = []
    @cargo = 0
    @passenger = 0
  end
  
  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_by_type(type)
    count_trains = 0
    @trains.each do |train|
      
      if train.type == type
        count_trains += 1
      end
    end
  end
end