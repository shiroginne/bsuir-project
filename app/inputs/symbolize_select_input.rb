class SymbolizeSelectInput < SimpleForm::Inputs::Base
  def input
    input_options.delete(:as)
    values = @builder.object.class.send("get_#{attribute_name}_values")
    if options[:except]
      except = [options.delete(:except)].flatten
      values.reject! { |_, k| except.include?(k) }
    end
    @builder.select(attribute_name, values, input_options, input_html_options)
  end
end
