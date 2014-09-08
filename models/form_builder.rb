class FormBuilder
attr_accessor :path, :request, :fields, :field_name, :finished_fields, :inputs, :finished_form

  def initialize(params_hash)
    @path = params_hash['path']
    @request = params_hash['request']
    @inputs = []
    @fields = params_hash['form_fields']
    @finished_fields = []
    field_factory

    @finished_form = build_form
  end

  def build_form
      form = ""
      form << "<form action='#{path}' method='#{request}'>"
      finished_fields.each do |field|
        form << field
      end
      form << "<button type='submit'>Submit</button>"
      form << "</form>"
  end

  def field_factory
    inputs = []
    fields.each_value do |field|
      field.each do |key, value|
        inputs << "#{key}='#{value}' "
      end
      complete = "<input " + inputs.join('') + ">"
      finished_fields << complete
      inputs.clear
    end
  end

  # def textarea_field
  # end

end
