# frozen_string_literal: true

class Wagon
  include InstanceCounter
  include Factory

  attr_reader :current_train, :busy_volume

  def initialize(type)
    @type = type
    @busy_volume = 0
    validate!
    register_instance
    @number = self.class.instances

  end

  def get_current_train(train)
    @current_train = train.number
  end

  def del_current_train
    @current_train = nil
  end

  def fill_wagon(busy = 1)
    @busy_volume += busy
  end

  def free_space
    @free_space = @volume
    @free_space - @busy_volume
  end

  def valid?
    validate!
  rescue StandardError
    false
  end
end
