module Accessor
  def my_attr_accessor method_name
    define_method method_name do
      ivar = "@#{method_name}"
      instance_variable_get ivar
    end

    define_method "#{method_name}=" do |new_val|
      ivar = "@#{method_name}"
      instance_variable_set ivar, new_val
    end
  end

end

class Animal
  extend Accessor

  my_attr_accessor "feet"
  my_attr_accessor "name"

  def initialize name
    @name = name
  end
end

cow = Animal.new("herb")
puts cow.name
cow.feet = 4
puts cow.feet

