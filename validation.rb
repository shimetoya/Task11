module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, rule, arg = nil)
      class_variable_set(:@@validate_rules, []) unless class_variables.include?(:@@validate_rules)
      class_variable_get(:@@validate_rules) << {
        name: name,
        rule: rule,
        arg: arg
      }
    end
  end

  module InstanceMethods
    def validate!
      self.class.class_variable_get(:@@validate_rules).each do |rule|
        val = instance_variable_get("@#{rule[:name]}".to_sym)
        case rule[:rule]
          when :presence
            raise'Name cant be empty' unless val
          when :format
            raise'Arg must be format' unless val =~ rule[:arg]
          when :type
            raise'Type must be identical' unless val.instance_of?(rule[:arg])
        end
      end
      true
    end

    def valid?
      validate!
    rescue
      false
    end
  end
end

class Test
  include Validation
  attr_accessor :a, :b
  validate :a, :presence 
  validate :b, :type, String
end

t = Test.new
t.a = 'aaa'
t.b = '111'
t.validate!