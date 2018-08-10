module Pservices
  class FormField
    attr_accessor :name, :form_type, :value_type, :options, :required, :default, :label
    # :name         => Field Name
    # :form_type    => (input, text_area, select, file)
    # :value_type   => value type (string?)
    # :options      => options for select types
    # :required     => boolean
    # :default      => Default Value
    # :label        => Field Label in React
    def initialize(name:, form_type:, value_type: 'string', options: [], required: false, default: '', label:)
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