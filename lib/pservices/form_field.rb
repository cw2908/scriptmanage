module Pservices
  class FormField
    attr_accessor :name, :form_type, :value_type, :options, :required, :default, :label
    def initialize(name:, form_type:, value_type:, options: [], required: false, default: '', label:)
      self.name = name
      self.form_type = form_type
      self.label = label
      self.value_type = value_type
      self.options = options
      self.default = default
      self.required = required
    end
  end
end