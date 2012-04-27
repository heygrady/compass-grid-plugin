# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "compass/grid/version"

Gem::Specification.new do |s|
  s.name        = 'compass-grid-plugin'
  s.version     = Compass::Grid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Compass grid extension inspired by the 1KB CSS Grid"
  s.description = "Compass grid extension inspired by the 1KB CSS Grid. Supports fixed and fluid grids. Designed to utilize Sass and Compass to remove unnecessary classes from the HTML markup and make customization easier."
  s.homepage    = 'https://github.com/heygrady/compass-grid-plugin'
  s.authors     = ["Grady Kuhnline"]
  s.email       = ["github@heygrady.net"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("compass")
end