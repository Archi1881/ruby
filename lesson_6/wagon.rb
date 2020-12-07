class Wagon
  attr_reader :current_train

  def initialize(type)
    @type = type
    validate!
  end

  def get_current_train(train)
    @current_train = train.number
  end

  def del_current_train
    @current_train = nil
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise "Такого типа вагона не существует" if type != cargo || type != passenger
    true
  end
end