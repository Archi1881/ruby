class CargoWagon < Wagon
  attr_reader  :busy_volume

  def initialize(volume = 1000)
  	@volume = volume
  	@busy_volume = 0  	
  end

  def busy_volume
  	@busy_volume += 1 if @busy_volume < volume
  end

  def single_volume
    @volume - @busy_volume
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