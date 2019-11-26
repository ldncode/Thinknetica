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
      @validations ||= []
      @validations << { name: name, type: type, args: args}
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validate|
        value = instance_variable_get("@#{validate[:name]}")
        case validate[:type]
        when :presence
          raise ArgumentError 'Пустое значение' if value.nil? || value == ''
        when :format
          raise ArgumentError 'Неправильный формат' if value !~ validate[:args]
        when :type
          raise ArgumentError 'Неправильный тип' if value.class != type
        end
        end
      end
    end
    def valid?
      validate!
      true
    rescue ArgumentError
      false
    end
  end



