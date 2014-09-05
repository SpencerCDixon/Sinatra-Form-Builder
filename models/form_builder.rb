class FormBuilder
attr_accessor :path, :request, :fields, :field_name, :finished_fields, :inputs

  def initialize(params_hash)
    @path = params_hash['path']
    @request = check_request_type(params_hash)
    @inputs = []
    @fields = params_hash['form_fields']
    @finished_fields = []
    field_factory
    # binding.pry
  end

  def check_request_type(params_hash)
     params_hash['GET'] == 'on' ? "GET" : "POST"
  end

  def build_form
      %Q{<form action='#{path}' method='#{request}'>
          <input type='#{field}' name='#{field_name}'>
          <input type='submit'>
        </form>}
  end

  def field_factory
    inputs = []
    fields.each_value do |field|
      field.each do |key, value|
        inputs << "#{key}='#{value}' "
      end
      complete = "<input " + inputs.join(' ') + ">"
      finished_fields << complete
      inputs.clear
    end
    binding.pry
  end

  # def textarea_field
  # end

end
