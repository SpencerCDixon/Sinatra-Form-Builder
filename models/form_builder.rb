class FormBuilder
attr_accessor :path, :request, :fields, :field_name, :finished_fields

  def initialize(params_hash)
    @path = params_hash['path']
    @request = check_request_type(params_hash)
    @fields = params_hash['form_fields']
    @finished_fields = []
    field_factory(fields)
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

  def field_factory(hash_of_all_fields)
    hash_of_all_fields.each_value do |field|
      binding.pry
      # finished_fields = []
      # finished_fields << "<input type='#{field["field_type"]}' name='#{field["field_name"]}'>"
      field.each do |key, value|
        binding.pry
        finished_fields << "<input #{key}='#{value}'>"
      end
    end
  end

  # def textarea_field
  # end

end
