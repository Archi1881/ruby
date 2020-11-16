class Station
 
  attr_reader :name, :trains 

  def initialize(name)
    @name = name
    @trains = []
  end
  
  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_by_type(type)
    trains_by_type = []
    @trains.each do |train|
      if train.type == type
        trains_by_type << train     
      end
    end
    return trains_by_type
  end
end
