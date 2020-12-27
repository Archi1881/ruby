# frozen_string_literal: true

class PassengerTrain < Train
	include Validation
	
  def type
    :passenger
  end
end
