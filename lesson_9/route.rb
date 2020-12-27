# frozen_string_literal: true

class Route

  include InstanceCounter
  include Validation

  attr_reader :stations, :first_station, :last_station

  validate :name, :presence

  @@all = []

  def self.all
    @@all
  end

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    validate!
    @@all << self
    register_instance

  end

  def add_stations(station)
    @stations.insert(-2, station)
  end

  def delete_stations(station)
    @stations.delete(station)
  end
end
