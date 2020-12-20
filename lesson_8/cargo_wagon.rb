# frozen_string_literal: true

class CargoWagon < Wagon
  def initialize(volume = 1000)
    super
    @volume = volume
  end

  def type
    :cargo
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Объем вагона 1000 кубов' if volume > 1000
  end
end
