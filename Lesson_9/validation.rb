# frozen_string_literal: true
require 'byebug'

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations
    def validate(name, type, *args)
      #нужно сохранять значения которые поступают
      @validations ||= []
      @validations << { name: name, type: type, args: args}
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validate|
        value = instance_variable_get(validate[:name])
        byebug
        if validate[:type] == :presence
          raise 'Пустое значение' if value.nil?
        elsif validate[:type] == :format
          raise 'Неправильный формат' if value !~ validate[:args]
        elsif validate[:type] == :type
          raise 'Неправильный тип' if value.class != type
        end
        end
      end
    end
    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end



