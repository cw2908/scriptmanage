module Pservices
  class Parameter
    attr_accessor :value, :name, :parsed
    def initialize(name:, value:, parsed:)
      self.value = value
      self.name = name
      self.parsed = parsed
      unless self.parsed.respond_to?(:*)
        raise ArgumentError
      end
    end
  end
end