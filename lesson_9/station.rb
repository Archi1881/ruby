# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation


  @@all = []

  attr_reader :name, :trains, :cargo, :passenger, :all_stations

  validate :name, :presence


  def initialize(name)
    @name = name
    @trains = []
    @cargo = 0
    @passenger = 0
    validate!
  end

  def self.all
    @@all
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_by_type(type)
    count_trains = 0
    @trains.each do |train|
      count_trains += 1 if train.type == type
    end
  end

  def all_trains(&block)
    @trains.each(&block)
  end
end
