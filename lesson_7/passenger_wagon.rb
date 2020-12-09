class PassengerWagon < Wagon
	attr_reader :busy_seats

	def initialize(seats = 15)
		@seats = seats
		@busy_seats = 0
	end

  def type
    :passenger
  end

  def busy_seats
  	@busy_seats += 1 if @busy_seats < @seats
  end

  def single_seats
  	@seats - @busy_seats
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