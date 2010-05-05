module Shoulda # :nodoc:
  module ActiveRecord # :nodoc:
    module Matchers

      def validate_format_of(attr)
        ValidateFormatOfMatcher.new(attr)
      end

      class ValidateFormatOfMatcher < ValidationMatcher # :nodoc:
        
        attr_accessor :invalid_value

        def with_message(message)
          @expected_message = message if message
          self
        end
        
        def with_invalid_value(value)
          @invalid_value = value
          self
        end

        def matches?(subject)
          super(subject)
          @expected_message ||= :invalid
          disallows_value_of(invalid_value, @expected_message)
        end

        def description
          "only allow values for #{@attribute} which match format"
        end
      end

    end
  end
end


module Shoulda # :nodoc:
  module ActiveRecord # :nodoc:
    module Macros

      def should_validate_format_of(*attributes)
        message, invalid_value = get_options!(attributes, :message, :invalid_value)
        klass = model_class
        attribute = attributes.first
        matcher = validate_format_of(attribute).with_message(message).with_invalid_value(invalid_value)
        should matcher.description do
          assert_accepts matcher, get_instance_of(klass)
        end
      end

    end
  end
end