class FormBuilder
attr_accessor :path, :request, :field, :field_name

  def initialize(params_hash)
    @path = params_hash['path']
    @request = check_request_type(params_hash)
    @fields = params_hash['form_fields']
    @template = call_all_methods
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

  def text_field
  end

  def phone_field
  end

  def email_field
  end

  def password_field
  end

  def submit
  end

  # def textarea_field
  # end

end
