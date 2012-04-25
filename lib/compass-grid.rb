require 'compass' # Ensure Compass
require 'compass/grid'

# Ensure maximum useful precision
Sass::Script::Number.precision = 7

module Sass::Script::Functions
  def precision(*args)
  	if !args[0].nil?
  		precision = args[0]
  		assert_type precision, :Number
  		Sass::Script::Number.precision = precision.value
  	end
    Sass::Script::Number.new(Sass::Script::Number.precision)
  end

  declare :precision, :args => [:number]
end