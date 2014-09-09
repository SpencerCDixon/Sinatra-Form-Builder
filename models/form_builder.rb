require 'rouge'

class FormBuilder
attr_accessor :path, :request, :fields, :field_name, :finished_fields, :inputs, :finished_form, :formatted_form

  def initialize(params_hash)
    @path = params_hash['path']
    @request = params_hash['request']
    @inputs = []
    @fields = params_hash['form_fields']
    @finished_fields = []
    field_factory

    @finished_form = build_form
    @formatted_form = formatter.format(lexer.lex(finished_form))
  end

  def build_form
      form = ""
      form << "<form action='#{path}' method='#{request}'>\n"
      finished_fields.each do |field|
        form << field + "\n"
      end
      form << "  <button type='submit'>Submit</button>\n"
      form << "</form>"
  end

  def field_factory
    inputs = []
    fields.each_value do |field|
      field.each do |key, value|
        inputs << "#{key}='#{value}'"
      end
      complete = "  <input " + inputs.join('') + ">"
      finished_fields << complete
      inputs.clear
    end
  end

  def formatter
    @formatter ||= Rouge::Formatters::HTML.new
  end

  def lexer
    @lexer ||= Rouge::Lexer.find_fancy("html", finished_form) || Rouge::Lexers::PlainText
  end
  # def textarea_field
  # end

end
