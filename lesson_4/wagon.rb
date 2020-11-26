class Wagon
  attr_reader :current_train

  def initialize(type)
    @type = type
  end

  def get_current_train(train)
    @current_train = train.number
  end

  def del_current_train
    @current_train = nil
  end
end