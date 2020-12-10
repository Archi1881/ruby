class CargoWagon < Wagon

  def initialize(volume = 1000)
    @volume = volume
  end

  def type
    :cargo
  end

  def valid?
    validate!
  rescue
    false
  end
  
  protected

  def validate!
    raise "Объем вагона 1000 кубов" if volume > 1000
  end
end