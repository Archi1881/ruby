# frozen_string_literal: true

class CargoTrain < Train
	include Validation
	
  def type
    :cargo
  end
end
