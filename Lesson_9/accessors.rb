# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|

        var = "@#{name}".to_sym
        var_name_history = "@#{name}_history".to_sym

        define_method("#{name}_history".to_sym) { instance_variable_get(var_name_history) }

        define_method(name) { instance_variable_get(var) }

        define_method("#{name}=".to_sym) do |value|
          if instance_variable_get(var_name_history)
            old_value = instance_variable_get(var)
            instance_variable_get(var_name_history) << old_value
          else
            instance_variable_set(var_name_history, [])
          end
          instance_variable_set(var, value)
        end
      end
    end

    def strong_attr_accessor(name, type)
      var = "@#{name}".to_sym

      define_method(name) { instance_variable_get(var) }

      define_method("#{name}=".to_sym) do |value|
        raise 'Неправильный класс' unless value.is_a?(type)

        instance_variable_set(var, value)
      end
    end
  end
end

