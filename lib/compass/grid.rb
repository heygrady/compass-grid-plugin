require 'compass/grid/version'

module Compass
  module Grid
    Compass::Frameworks.register('compass-grid', :path => "#{File.dirname(__FILE__)}/../..")
  end
end