# frozen_string_literal: true

# Allows a class to be called directly
module Callable
  extend ActiveSupport::Concern
  class_methods do
    def call(*args)
      new(*args).call
    end
  end
end
