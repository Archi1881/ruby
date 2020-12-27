# frozen_string_literal: true

module InstanceCounter
  module ClassMethod
    attr_accessor :instances

    def instances
      @instances ||= 0
    end

    def self.instances
      @instances
    end
  end

  module InstanceMethod
    protected

    def register_instance
      @instances += 1
    end
  end
end
