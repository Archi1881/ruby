class PassengerWagon < Wagon

  def initialize(volume = 15)
    @volume = volume
  end

  def type
    :passenger
  end

  def valid?
    validate!
  rescue
    false
  end
  
  protected

  def validate!
    raise "Максимальное количество мест в вагоне не должно превышать 15" if seats > 15
  end
end